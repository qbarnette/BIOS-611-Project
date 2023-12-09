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


# Set the working directory to the "source_data" folder
setwd("C:/Users/qbarnette/OneDrive - Research Triangle Institute/UNC/BIOS 611/bios_611_project/source_data")


# Load the "merged_data" dataset from the CSV file
merged_data <- read.csv("merged_data.csv")

