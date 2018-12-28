# R_read data

1. getwd
2. setwd

Notes:
1. in mac, use /; in windows, use \.


## download files
 1. check if it exits
<pre><code>
  if (!file.exists("data")) {
  dir.create("data")
}
<\code><\pre>

2. download files from Internet
<pre><code>
url <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(url, destfile = "./data/sp500.csv", method = "curl")
list.files("./data")

dateDownloaded <- date()
dateDownloaded
  <\code><\pre>

Notes:
1. http
2. https: for mac, need to set method = "curl"

## read local file (csv, txt)
1. read_table
important parameters: header, sep, row.names, nrows, quote, na.strings, skip


2. read_csv, read_csv2

2. 
