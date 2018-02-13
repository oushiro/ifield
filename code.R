#Code to plot spantrees

rm(list=ls(all=TRUE)) # clear memory

#uncomment and fill the line below if you want to set a working directory
#setwd("")

#load data
data <- read.csv("https://raw.githubusercontent.com/oushiro/datafiles/master/dataPerceptionR.csv", sep = ";")

#check if data is alright
head(data)
str(data)

#load required packages
library(amap); library(vegan)

#uncomment and fill the line below if you want to create a subset
#data <- subset(data, listFemale %in% 1)

#uncomment and fill the line below if you want to exclude columns/variables
#data <- data[,-c(49:52)]

#transpose data to enter Dist() function
newData <- t(data)


###########################SPANTREES###########################

data.dist <- Dist(newData, method = "correlation", upper = TRUE, diag = TRUE) # compute (dis)similarity matrix
spanT <- spantree(data.dist, toolong=0)

par(mar=c(4, .5, .5, .5) + 0.1)
aa <- plot(spanT, xlab = "", ylab = "", axes = F, main = "", type = "l", lty = 3, col = "gray70")
text(spanT$labels, x = aa$sites[,1], y = aa$sites[,2], cex = 1, col = "black")
par(mar = c(5, 4, 4, 2) + 0.1)

dev.print(pdf, file = "SpanTree.pdf", width = 15, height = 10)
