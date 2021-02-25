## GLMM model code for Brandell et al. 2020

## Here we demonstrate the code with canine parvovirus (CPV), although the code is the same for all pathogens - just replace 'cpv.binary' with the pathogen of interest.

# load libraries
library(lme4)      # glmer
library(ggplot2)   # plotting
library(jtools)    # model summaries, ICC, psuedo-R^2
library(pROC)      # ROC calculations
library(merTools)  # plot REsim
library(lattice)   # dotplot

data <- read.csv("dataset.csv")

## geographic model
geo.mod <- 
  glmer(cpv.binary ~ standard.latitude + standard.longitude + age.cat + (1|pop), 
        data=data, 
        family=binomial(link=cloglog),
        control=glmerControl(optimizer="bobyqa", 
                             optCtrl=list(maxfun=2e5)))
summary(geo.mod)


## complete model - wolf density
## * In the Results, output from the complete model with wolf density is reported (e.g., Table S7 all variables except latitude and longitude (geo.mod), and human density (hum.mod)).
wolf.mod <- 
  glmer(cpv.binary ~ standard.packsize + standard.habitat +  standard.pop +
          age.cat + color + sex + (1|pop/year), 
        data=data, 
        family=binomial(link=cloglog),
        control=glmerControl(optimizer="bobyqa", 
                             optCtrl=list(maxfun=2e5)))
summary(wolf.mod)

## complete model - wolf density. fixed effects only, needed for certain model evaluation criteria.
wolf.mod.glm <- 
  glm(cpv.binary ~ standard.packsize + standard.habitat +  standard.pop +
          age.cat + color + sex, 
        data=data, 
        family=binomial(link=cloglog))
summary(wolf.mod.glm)

## complete model - human density
hum.mod <- 
  glmer(cpv.binary ~ standard.packsize + standard.habitat + standard.human +
          age.cat + color + sex + (1|pop/year), 
        data=data, 
        family=binomial(link=cloglog),
        control=glmerControl(optimizer="bobyqa", 
                             optCtrl=list(maxfun=2e5)))
summary(hum.mod)

## assess random effects, ICC (for complete models)
summ(wolf.mod, exp=T)
## estimate pseudo-R^2 (fixed effects model)
summ(wolf.mod.glm, exp=T)

## plot model outputs - switch out any model of interest and the parameter of interest. only uses fixed effects to estimate.
effect_plot(wolf.mod.glm, pred=standard.pop, interval=T,
                rug=TRUE, rug.sides = "tb", jitter=0.05)
effect_plot(wolf.mod.glm, pred=standard.packsize, interval=T,
                rug=TRUE, rug.sides = "tb", jitter=0.05)
effect_plot(wolf.mod.glm, pred=standard.habitat, interval=T, 
                rug=TRUE, rug.sides = "tb", jitter=0.05)
effect_plot(wolf.mod.glm, pred=age.cat, interval=T, plot.points=T,
                point.color='gray70', jitter=0.05)
effect_plot(wolf.mod.glm, pred=color, interval=T, plot.points=T,
                point.color='gray70', jitter=0.05)
effect_plot(wolf.mod.glm, pred=sex, interval=T, plot.points=T,
                point.color='gray70', jitter=0.05)

## plot point estimates and confidence intervals
plot_summs(geo.mod, inner_ci_level=.5)
plot_summs(wolf.mod, inner_ci_level=.5)
plot_summs(hum.mod, inner_ci_level=.5)

## look at random effects
plotREsim(REsim(wolf.mod))	 
dotplot(ranef(wolf.mod, condVar=TRUE))
exp(ranef(wolf.mod, condVar=TRUE)$pop)
exp(ranef(wolf.mod, condVar=TRUE)$'year:pop')


####### cross-validation shown with complete model (with wolf density)
# assign groups:
train1 <- c("AK.PEN", "DENALI", "INT.AK", "ELLES", "SS.NWT", "BC", "SE.AK", "BAN.JAS", "YNP", "GTNP", "MEXICAN", "SNF", "MI")
test1 <- c("YUCH", "N.NWT", "MT", "ONT")

train2 <- c("AK.PEN", "YUCH", "INT.AK", "N.NWT", "SS.NWT", "BC", "SE.AK", "BAN.JAS", "MT", "GTNP", "MEXICAN", "ONT", "MI")
test2 <- c("DENALI", "ELLES", "YNP", "SNF")

train3 <- c("DENALI", "YUCH", "INT.AK", "ELLES", "N.NWT", "SS.NWT", "BC", "BAN.JAS", "YNP", "MT", "MEXICAN", "SNF", "ONT")
test3 <- c("AK.PEN", "SE.AK", "GTNP", "MI")

train4 <- c("AK.PEN", "DENALI", "YUCH", "ELLES", "N.NWT", "BC", "MT", "YNP", "GTNP", "SE.AK", "SNF", "MI", "ONT")
test4 <- c("INT.AK", 'SS.NWT', "BAN.JAS", "MEXICAN")

training <- data.frame(cbind(train1, train2, train3, train4))
testing <- data.frame(cbind(test1, test2, test3, test4))

# create results dataframe to fill
cv.results <- data.frame(matrix(ncol=6, nrow=ncol(training)+1))
colnames(cv.results) <- c("set", "model", "in.rmse", "out.rmse", "in.auc", "out.auc")

for(i in 1:ncol(training)){
  # select your dataset, only use complete cases
  temp.train.pop <- training[,i]
  temp.train <- data[data$pop %in% temp.train.pop ,]
  temp.train.complete <- temp.train[complete.cases(temp.train),]
  temp.test.pop <- testing[,i]
  temp.test <- data[data$pop %in% temp.test.pop ,]
  temp.test.complete <- temp.test[complete.cases(temp.test),]
  
  cv.results$set[i] <- paste(i)
  cv.results$model[i] <- "complete"
  
  # only fixed effects
  mod.fe.train <- 
    lm(chv.binary ~ standard.packsize + standard.habitat +  standard.pop +
         age.cat + color + sex,
       data=temp.train.complete)
  
  ## CALCULATE IN SAMPLE RMSE
  cv.results$in.rmse[i] <- round(sqrt(mean(mod.fe.train$residuals^2)),4)
  
  ## CALCULATE IN SAMPLE AUC
  response <- temp.train.complete$chv.binary
  temp.roc <- roc(response, mod.fe.train$fitted.values, plot=F)
  cv.results$in.auc[i] <- round(temp.roc$auc,4)
  
  ## CALCULATE OUT SAMPLE RSME
  predicted <- predict(mod.fe.train, temp.test.complete, type="response", na.action=na.omit) 
  actual <- temp.test.complete$chv.binary
  cv.results$out.rmse[i] <- round(sqrt(mean((predicted-actual)^2)),4)
  
  ## CALCULATE OUT SAMPLE AUC
  result.predicted.prob <- predict(mod.fe.train, temp.test.complete, type="response")
  temp.roc2 <- roc(actual, result.predicted.prob, plot=F)
  cv.results$out.auc[i] <- round(temp.roc2$auc,4)
  
}

# calculate means across the 4 sets
cv.results[nrow(cv.results),1] <- "mean"
cv.results[nrow(cv.results),2] <- "complete"
cv.results[nrow(cv.results),3] <- round(mean(cv.results[1:ncol(training),3]),4)
cv.results[nrow(cv.results),4] <- round(mean(cv.results[1:ncol(training),4]),4)
cv.results[nrow(cv.results),5] <- round(mean(cv.results[1:ncol(training),5]),4)
cv.results[nrow(cv.results),6] <- round(mean(cv.results[1:ncol(training),6]),4)

# visual of the AUC - need complete dataset
data.complete <- data[,c(3:7,12:17,20)]
data.complete <- data.complete[complete.cases(data.complete),]
response <- data.complete$cpv.binary
roc(response, wolf.mod.glm$fitted.values, plot=TRUE, legacy.axes=TRUE, las=1, percent=TRUE, xlab="False Positive Percentage", ylab="True Postive Percentage", col="orange2", lwd=4, print.auc=TRUE)
