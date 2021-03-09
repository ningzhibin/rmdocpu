
#  the following scripts show how to use r to upload summary.txt to the opencpu server as the input to render an html report
#  then download the report to local storage
#  This function could be done by any script languange, such as java, perl or bash
#  by doing this, metalab can have the report easily, without the need to setup the r enviroment, but easily get all the report, especially with
#  various data visualization in the report
#  these report are all html based and could be linked/iframed on the website.


# curl way to make any opencpu request is detailed here: https://www.opencpu.org/api.html


#library(jsonlite)
#library(httr)


# summary.txt----

url_api <- "http://206.12.91.148/ocpu/library/rmdocpu/R/render_MQsummary_file"

url_api <- "http://34.212.56.214:8888/ocpu/library/rmdocpu/R/render_MQsummary_file"



# get the root url
url_api_split <- strsplit(url_api, "/")[[1]]
url_server<- paste0(url_api_split[1],"//", url_api_split[3],"/")



# upload file and do the rendering
# in this case, the summary.txt is in the working dir. it can be anywhere with the path
# meta file is optional

r <- httr::POST(url_api, body = list(file = httr::upload_file("summary.txt")))
#r <- httr::POST(url_api, body = list(file = httr::upload_file("summary1_simple.txt"), meta = httr::upload_file("summary1_meta.txt")))

# get all the paths of all files from the opencpu end, and locate the one, which is the report
# this step needs to be done in the script enviroment

paths <- strsplit(rawToChar(r$content), "\n")[[1]]
path_target <- paths[grep("output.html",paths)]

# save/download the report file to local storage
# the file  "maxquant_result_summary.html" now is the report
curl::curl_download(paste0(url_server, path_target), "report_ID_summary.html")



# test on locoal drive, using local rmd
data_table <- read.delim("summary.txt", header = TRUE,check.names = FALSE, stringsAsFactors = FALSE)
# knit to all supported format (here we support pdf and html)
rmarkdown::render("MQ_report_summary.Rmd",output_format = "all", params = list(summary_file_tbl =  data_table))



# proteingroups.txt----


url_api <- "http://206.12.91.148/ocpu/library/rmdocpu/R/render_proteinGroups_file"

# get the root url
url_api_split <- strsplit(url_api, "/")[[1]]
url_server<- paste0(url_api_split[1],"//", url_api_split[3],"/")


# upload file and do the rendering
# in this case, the proteinGroups.txt is in the working dir. it can be anywhere with the path
# variable r is the returning information from the curl function
r <- httr::POST(url_api, body = list(file = httr::upload_file("final_proteins.tsv")))
#r <- httr::POST(url_api, body = list(file = httr::upload_file("proteinGroups1.txt"), meta = httr::upload_file("proteinGroups1_meta.txt")), httr::timeout(200000))

r
# get all the paths of all files from the opencpu end, and locate the one, which is the report
# this step needs to be done in the script enviroment

paths <- strsplit(rawToChar(r$content), "\n")[[1]]
path_target <- paths[grep("output.html",paths)]
paths


# save/download the report file to local storage
# the file  "maxquant_result_summary.html" now is the report
curl::curl_download(paste0(url_server, path_target), "report_proteinGroups_summary.html")





# test on locoal rmd
data_table  <- read.delim("proteinGroups1.txt", header = TRUE,check.names = FALSE, stringsAsFactors = FALSE) # NOTE the read in options
meta_table <- read.delim("proteinGroups1_meta.txt", header = TRUE, check.names = FALSE, stringsAsFactors = FALSE) # with meta file
rmarkdown::render("MQ_report_proteinGroups.Rmd",output_format = "html_document", params = list(input_datatable =  data_table, meta_table = meta_table), output_file="output.html")


rmarkdown::render("MQ_report_proteinGroups.Rmd",output_format = "html_document", params = list(input_datatable =  data_table), output_file="output.html")


# server command

render_proteinGroups_file(file = "proteinGroups.txt")

render_proteinGroups_file <- function(file, meta = NULL){

  #data_table  <- readr::read_tsv(file, col_names = TRUE)
  data_table  <- read.delim(file, header = TRUE,check.names = FALSE, stringsAsFactors = FALSE) # NOTE the read in options

  myfile <- RCurl::getURL("https://raw.githubusercontent.com/ningzhibin/rmdocpu/master/inst/rmd/MQ_report_proteinGroups.Rmd")
  writeLines(myfile, con="input.Rmd");

  if(!is.null(meta)){
    meta_table <- read.delim(meta, header = TRUE, check.names = FALSE, stringsAsFactors = FALSE) # with meta file

    rmarkdown::render("input.Rmd",output_format = "html_document", params = list(input_datatable =  data_table, meta_table = meta_table), output_file="output.html")

  }else{
    rmarkdown::render("input.Rmd",output_format = "html_document", params = list(input_datatable =  data_table), output_file="output.html")
  }

  invisible()
}









# peptide.txt test ----


url_api <- "http://206.12.91.148/ocpu/library/rmdocpu/R/render_peptides_file"

# get the root url
url_api_split <- strsplit(url_api, "/")[[1]]
url_server<- paste0(url_api_split[1],"//", url_api_split[3],"/")

# upload file and do the rendering
# in this case, the proteinGroups.txt is in the working dir. it can be anywhere with the path
# variable r is the returning information from the curl function
r <- httr::POST(url_api, body = list(file = httr::upload_file("peptides.txt")))
#r <- httr::POST(url_api, body = list(file = httr::upload_file("peptides3.txt"),meta = httr::upload_file("peptides3_meta.txt")), httr::timeout(200000))
r$status_code

# get all the paths of all files from the opencpu end, and locate the one, which is the report
# this step needs to be done in the script enviroment

paths <- strsplit(rawToChar(r$content), "\n")[[1]]
path_target <- paths[grep("output.html",paths)]
path_target
# save/download the report file to local storage
# the file  "maxquant_result_summary.html" now is the report
curl::curl_download(paste0(url_server, path_target), "report_peptides_summary.html")




# test on local rmd file
data_table  <- read.delim("peptides3.txt", header = TRUE,check.names = FALSE, stringsAsFactors = FALSE) # NOTE the read in options
meta_table <- read.delim("peptides3_meta.txt", header = TRUE, check.names = FALSE, stringsAsFactors = FALSE) # with meta file
system.time(rmarkdown::render("MQ_report_peptides.Rmd",output_format = "html_document", params = list(input_datatable =  data_table, meta_table = meta_table), output_file="output.html"))





# test on locoal drive, using local rmd
data_table <- read.delim("peptides.txt", header = TRUE,check.names = FALSE, stringsAsFactors = FALSE)

rmarkdown::render("MQ_report_peptides.Rmd",output_format = "html_document", params = list(input_datatable =  data_table))


# knit to all supported format (here we support pdf and html)
rmarkdown::render("MQ_report_peptides.Rmd",output_format = "all", params = list(input_datatable =  data_table))




# MetaLab_taxonomy.csv ----


url_api <- "http://206.12.91.148/ocpu/library/rmdocpu/R/render_taxon_file"

# get the root url
url_api_split <- strsplit(url_api, "/")[[1]]
url_server<- paste0(url_api_split[1],"//", url_api_split[3],"/")

# upload file and do the rendering
# in this case, the proteinGroups.txt is in the working dir. it can be anywhere with the path
# variable r is the returning information from the curl function
r <- httr::POST(url_api, body = list(file = httr::upload_file("BuiltIn.taxa.refine.csv")))
r
# get all the paths of all files from the opencpu end, and locate the one, which is the report
# this step needs to be done in the script enviroment

paths <- strsplit(rawToChar(r$content), "\n")[[1]]
path_target <- paths[grep("output.html",paths)]

# save/download the report file to local storage
# the file  "maxquant_result_summary.html" now is the report
curl::curl_download(paste0(url_server, path_target), "report_taxonomy_summary.html")





# function.csv ----


url_api <- "http://206.12.91.148/ocpu/library/rmdocpu/R/render_function_file"

# get the root url
url_api_split <- strsplit(url_api, "/")[[1]]
url_server<- paste0(url_api_split[1],"//", url_api_split[3],"/")

# upload file and do the rendering
# in this case, the proteinGroups.txt is in the working dir. it can be anywhere with the path
# variable r is the returning information from the curl function
#r <- httr::POST(url_api, body = list(file = httr::upload_file("functions.csv")))
r <- httr::POST(url_api, body = list(file = httr::upload_file("functions.csv"), meta = httr::upload_file("metadata.txt")))

r$status_code

# get all the paths of all files from the opencpu end, and locate the one, which is the report
# this step needs to be done in the script enviroment

paths <- strsplit(rawToChar(r$content), "\n")[[1]]
path_target <- paths[grep("output.html",paths)]

# save/download the report file to local storage
# the file  "maxquant_result_summary.html" now is the report
curl::curl_download(paste0(url_server, path_target), "report_function_summary.html")






# debug ----


























# R has the “feature” of turning character strings automatically into factor variables.
# This is great, when doing actual statistical work. It is this magic that allows R to turn multinomial variables into
# dummy variables in regression models and produce nice cross tables. When working with APIs, however,
# this “feature” becomes a hinderance. Let’s just turn it off. Note: this call only affects the current session;
# when you restart R, all settings will be back to normal.




#summary_file  <- read_tsv("summary.txt", col_names = TRUE)

#summary_file_json <- toJSON(summary_file)

#tt <- paste0("data = '", t,"'")
#writeLines(tt, "mydata.json")


# test of the file converted back remains the same structure
# mq_smmary <- fromJSON(t)







# url_Server <- "https://cloud.opencpu.org/"
# url <- "https://cloud.opencpu.org/ocpu/library/stats/R/rnorm"


# this is the way hwo to use r to do the  POST job
# r <- RCurl::postForm(url, n=10)
# for parametr
# r <- httr::POST(url, body = list(n=10, mean =5))
# for file uploading
# r <- httr::POST("https://cloud.opencpu.org/ocpu/library/utils/R/read.csv", body = list(file = upload_file("summary.txt")))

# parse the response to get the path
# rawToChar(r$content) # or use toString(r)

#paths <- strsplit(rawToChar(r$content), "\n")[[1]]
#path_target <- paths[grep("DESCRIPTION",paths)]

# download file
#curl::curl_download(paste0(url_Server, path_target), "DESCRIPTION")


# POSt usage examples
# b2 <- "http://httpbin.org/post"
# POST(b2, body = "A simple text string")
# POST(b2, body = list(x = "A simple text string"))
# POST(b2, body = list(y = upload_file(system.file("CITATION"))))
# POST(b2, body = list(x = "A simple text string"), encode = "json")

















