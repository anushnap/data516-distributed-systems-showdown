## SET UP ENVIRONMENT #############################################################################
library(tidyverse)
library(scales)
library(readr)
library(stringr)
rm(list = ls())
setwd("C:/Users/anush/Documents/UW MS Data Science/DATA 516 - Scalable Data/data")
# CHANGE FOR DEBUGGING
files <- list.files(path = getwd(), pattern = "*.tsv.gz", full.names = TRUE, recursive = FALSE)
# files <- 'title.akas.tsv.gz'

# Below are known data types that are SUPER in the imdb data set
super_cols <- c('types', 'attributes', 'genres',
                'directors', 'writers', 'primaryProfession',
                'knownForTitles')

# Read each file and replace any sequence \002 with comma to flatten the ARRAY type to string
lapply(files, function(x) {
  data <- read_tsv(files, na = "\\N", quote = '')
  col_names <- names(data)
  is_super <- which(col_names %in% super_cols)
  
  for(s in is_super) {
    data[s] <- str_replace(data[s], pattern = '\002', replacement = ',')
  }
  print(head(data))
})

# title.akas
akas <- read_tsv('title.akas.tsv.gz', na = "\\N", quote = '')
akas$types <- str_replace(akas$types, pattern = '\002', replacement = ',')
# unique(data$types)
# unique(data$types_mod)
akas$attributes <- str_replace(akas$attributes, pattern = '\002', replacement = ',')
# unique(data$attributes)
# unique(data$attributes_mod)

write_tsv(akas, file = 'title_akas.tsv')
rm(akas)

# name.basics
name_basics <- read_tsv('name.basics.tsv.gz', na = '\\N', quote = '')

write_tsv(name_basics, file = 'name_basics.tsv')
rm(name_basics)