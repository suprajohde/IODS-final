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

year_2015 <- read.csv("~/Documents/IODS-final/Data/PIKI_lainatuimmat_2015.csv", sep=",", header=TRUE, stringsAsFactors = FALSE)
str(year_2015)
summary(year_2015)
summary(year_2015$Hyllypaikka)


## Year 2014
## Dataset name: "PIKI-kirjastojen 1000 lainatuinta teosta vuodelta 2014"

year_2014 <- read.csv("~/Documents/IODS-final/Data/PIKI_lainatuimmat_31122014.csv", sep=",", header=TRUE, stringsAsFactors = FALSE)
str(year_2014)
summary(year_2014)
summary(year_2014$Hyllypaikka)

## Year 2013
## Dataset name: "PIKI-kirjastojen 1000 lainatuinta teosta vuodelta 2013"

year_2013 <- read.csv("~/Documents/IODS-final/Data/PIKI_lainatuimmat_31122013.csv", sep=",", header=TRUE, stringsAsFactors = FALSE)
str(year_2013)
summary(year_2013)
summary(year_2013$Hyllypaikka)

## Year 2012
## Dataset name: "PIKI-kirjastojen 1000 lainatuinta teosta vuodelta 2013"

year_2012 <- read.csv("~/Documents/IODS-final/Data/PIKI_lainatuimmat_31122012.csv", sep=",", header=TRUE, stringsAsFactors = FALSE)
str(year_2012)
summary(year_2012)
summary(year_2012$Hyllpaikka)

## Years 2012 and 2013 pieces have several different shelf locations so to combine datasets
## first we have to limit it to only one location. Also because those years have all numbers
## of magazines in the same number of loads instead of having all magazine numbers as 
## several observations, all magazines must be removed from all datasets. Magazines belongs
## to shelf location 05.01

library(dplyr)
temp <- strsplit(year_2012$Hyllpaikka,',')

## shelf locations for magazines
to_be_deleted_magazines="0.51|05.1|05.|05.01"

## True/false values of to be deleted magazines
year_2012 <- mutate(year_2012, magazine = grepl(to_be_deleted_magazines,temp) )

## removing all rows that has magazine shelf location 
year_2012 <- filter(year_2012, magazine == FALSE)
year_2012

## only one self location per row (taking the first one mentioned)
year_2012$Hyllpaikka    <- unlist(temp)[2*(1:length(year_2012$Hyllpaikka))-1]
year_2012$Hyllpaikka 

## Renaming all columns similar (2012 Hyllpaikka vs. Hyllypaikka in the other sets)
colnames(year_2012)[colnames(year_2012)=="Hyllpaikka"] <- "Hyllypaikka"
colnames(year_2012)

## let's do the same to 2013 dataset

temp <- strsplit(year_2013$Hyllpaikka,',')
year_2013 <- mutate(year_2013, magazine = grepl(to_be_deleted_magazines,temp) )
year_2013 <- filter(year_2013, magazine == FALSE)
year_2013$Hyllpaikka    <- unlist(temp)[2*(1:length(year_2013$Hyllpaikka))-1]
colnames(year_2013)[colnames(year_2013)=="Hyllpaikka"] <- "Hyllypaikka"
colnames(year_2013)

# from datasets 2014 and 2015 we have to remove all magazines as well
temp <- strsplit(year_2014$Hyllypaikka,',')
year_2014 <- mutate(year_2014, magazine = grepl(to_be_deleted_magazines,temp) )
year_2014 <- filter(year_2014, magazine == FALSE)

temp <- strsplit(year_2015$Hyllypaikka,',')
year_2015 <- mutate(year_2015, magazine = grepl(to_be_deleted_magazines,temp) )
year_2015 <- filter(year_2015, magazine == FALSE)


## Merging all data sets and removing unnessessary columns
keep_columns <- c("Hyllypaikka", "Tekijä", "Nimeke", "Lainojen.lkm.", "ISBN.ISSN", "Julkaisuvuosi")
year_2012 <- select(year_2012, one_of(keep_columns))
year_2013 <- select(year_2013, one_of(keep_columns))
year_2014 <- select(year_2014, one_of(keep_columns))
year_2015 <- select(year_2015, one_of(keep_columns))

year_2012 <- mutate(year_2012, vuosi = "2012")
year_2013 <- mutate(year_2013, vuosi = "2013")
year_2014 <- mutate(year_2014, vuosi = "2014")
year_2015 <- mutate(year_2015, vuosi = "2015")

library_data_2012_2013 <- merge(year_2012, year_2013, all=TRUE)
library_data_2014_2015 <- merge(year_2014, year_2015, all=TRUE)
library_data <- merge(library_data_2012_2013, library_data_2014_2015, all=TRUE)

## saving data set

setwd("~/Documents/IODS-final/data")
write.csv(library_data, "library_data.csv")
