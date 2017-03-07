## Tiina Autio
## tiina.autio@helsinki.fi
## 5/3/2017

## This is the data wrangling for IODS final assignment's data

## For data I chose to analyse most loaned books from Pirkanmaa librarys. Datasets can
## be found here: http://www.tampere.fi/tampereen-kaupunki/tietoa-tampereesta/avoin-data.html

## Each data set contains top 1000 most loaned pieces.
## All datasets contains only data of new loads and not renewals so thus they 
## are easy to combine. Also each file contains data from only one year starting from 1st
##of January to 31st of December so there are no overlappings on time periods. Data
## is combined data from all Pirkanmaa librarys. Years 2015 and 2014 differs from earlier years 
## so that there are no distant loans in the data set. 


## Year 2015
## Dataset name: "PIKI-kirjastojen 1000 lainatuinta teosta vuodelta 2015"

year_2015 <- read.csv("~/Documents/IODS-final/Data/PIKI_lainatuimmat_2015.csv", sep=",", header=TRUE)
str(year_2015)
summary(year_2015)
summary(year_2015$Hyllypaikka)


## Year 2014
## Dataset name: "PIKI-kirjastojen 1000 lainatuinta teosta vuodelta 2014"

year_2014 <- read.csv("~/Documents/IODS-final/Data/PIKI_lainatuimmat_31122014.csv", sep=",", header=TRUE)
str(year_2014)
summary(year_2014)
summary(year_2014$Hyllypaikka)

## Year 2013
## Dataset name: "PIKI-kirjastojen 1000 lainatuinta teosta vuodelta 2013"

year_2013 <- read.csv("~/Documents/IODS-final/Data/PIKI_lainatuimmat_31122013.csv", sep=",", header=TRUE)
str(year_2013)
summary(year_2013)
summary(year_2013$Hyllypaikka)

## Year 2012
## Dataset name: "PIKI-kirjastojen 1000 lainatuinta teosta vuodelta 2013"

year_2012 <- read.csv("~/Documents/IODS-final/Data/PIKI_lainatuimmat_31122012.csv", sep=",", header=TRUE, stringsAsFactors = FALSE)
str(year_2012)
summary(year_2012)
summary(year_2012$Hyllypaikka)

## Years 2012 and 2013 pieces have several different shelf locations so to combine datasets
## first we have to limit it to only one location. Also because those years have all numbers
## of magazines in the same number of loads instead of having all magazine numbers as 
## several observations, all magazines must be removed from all datasets. Magazines belongs
## to shelf location 05.01

n <- nrow(year_2012)

for ()
  
  
##  temp vektori johon sijoitetaan rivin kaikki eri luokat
##vektorin eka jasen luetaan takaisin taulukkoon

library(dplyr)

library(tidyr)
separate(data.frame(Hyllpaikka = year_2012$Hyllpaikka), col = "Hyllpaikka" , into = c("X", "Y"), sep = ",")

library(dplyr)
library(tidyr)

as.data.frame(year_2012$Hyllpaikka) %>% separate(year_2012$Hyllpaikka, into = paste("Hyllypaikka", 1:2, sep = "_"))

testi <- strsplit(year_2012$Hyllypaikka, split=",")
temp <- c(strsplit(year_2012$Hyllpaikka, ", "))

elems <- unlist( strsplit( year_2012$Hyllpaikka , "," ) )

#  We know the dataframe should have 4 columns, so make a matrix
m <- matrix( elems , ncol = 2 , byrow = TRUE )

#  Coerce to data.frame - head() is just to illustrate the top portion
head( as.data.frame( m ) )


temp

substring="0.51|05.1|05.|05.01"
string_vector=c("ass","ear","eye","heat") 
grepl(substring,temp)

temp
newCol1<-strsplit(as.character(year_2012$Hyllpaikka),'|',fixed=TRUE)
year_2012<-data.frame(year_2012,do.call(rbind, newCol1))
newCol2<-strsplit(as.character(df$X3),'_',fixed=TRUE)
df<-data.frame(df,do.call(rbind, newCol2))
df$X1<-paste(df$X1,'|',df$X2,'|',sep='')
df<-df[,-c(4,5)]

## Renaming all columns similar (2012 Hyllpaikka vs. Hyllypaikka in the other sets)
merge(eka, toka, all=TRUE)
