## nexisFunctions.R
## Functions for reading and initial cleaning of news articles from Nexis Uni

## See the NexisUniNewsArticles.pdf for an overview

library(dplyr)
library(readtext)
library(readr)
library(stringr)
library(purrr)

# takes a single string and returns a string

cleanSingleNexisNews <- function(articleString){
  articleLines <- unlist(str_split(articleString, "\n"))
  frontBound <- which(!is.na(str_match(articleLines, "Body"))) + 1
  backBound <- length(articleLines) - 3
  articleCleaned <- articleLines[frontBound:backBound] %>%
    str_trim(side = "both") %>%
    str_c(collapse = "\n")
  return(articleCleaned)
}

# takes a vector of strings, returns vector of cleaned strings

cleanMultipleNews <- function(vector) {
  map_chr(vector, cleanSingleNexisNews)
}

# perform all operations for reading in files, adding date and publication, and
# cleaning text -- takes relative path to the folder where PDFs are (i.e. "data/")

processNexisNews <- function(folder) {
  articles_dataframe <- readtext::readtext(str_c(folder, "/*.pdf")) %>%
    mutate(date = str_extract(text, "\\w+\\s\\d{1,3},\\s\\d{4}") %>%
             lubridate::mdy()) %>%
    mutate(publication = str_extract(text, ".+\\s+(?=.+\\d{4})") %>%
             str_trim(side = "both")) %>%
    mutate(text = cleanMultipleNews(text)) %>%
    tibble() %>%
    select(doc_id, date, publication, text)
  
  return(articles_dataframe)
}