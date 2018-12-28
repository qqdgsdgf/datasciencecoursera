setwd("./datasciencecoursera/R_notes")
getwd()
list.files()

if (!file.exists("cameras.xlsx")) {
  url <- ""
  download.file(url, destfile = "camera.xlsx", method = "curl")
}

cod <- read.table("sp500.csv", header=F, sep=',')
