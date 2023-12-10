# Load libraries
rm(list = ls())
library(httr)
library(lmtest)
library(lubridate)
library(openxlsx)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(knitr)
library(reshape2)
library(kableExtra)

merged_data <- read.csv("source_data/merged_data.csv")
