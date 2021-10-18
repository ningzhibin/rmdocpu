# Opencpu server package for metalab result report/metereport



In this package, we use opencpu server to do the data analysis and generate report. These functions are all in R/rmdtext.R. They top wrappers of doing the one step analysis. 

The rmarkdown template files are all in \inst\rmd by default. 
The rmarkdown template needs very often update (this pacakge is still under active development), therefore the we let the r wrapper function to read the rmarkdown files directly from github/gitlab.
By doing this, the opencpu server do not need to update this package each time when there is a update of the rmarkdown template, otherwise if the wrapper function uses the rmarkdown files locally. 
Once the pacakge is relative stabilized, the wrapper function will turn to using rmardown files locally. 

How to setup?
1--In order to use this function, user need to have an opencpu server setup first (check the opencpu website for the installation). You need to write down the api url, like http://ipv4-address/ocpu/library/rmdocpu/R/sub-function-name
It would be better to have one or even more opencpu server as backup. 

2--Install this rmdocpu package from the github

How to use?

First choice is that you can use it in R, as demoed in the R_curl_ocpu_test_debug.R in the rmd folder
Once you know the principle how to upload (post) your data table, and download the report file (curl), you will be able to adapt this in to java, python, javascripit in html. 





## Install opencpu first

Requires Ubuntu 20.04 (Focal) or 18.04 (Bionic)

On a fresh system, like AWS EC2.

```
sudo add-apt-repository -y ppa:opencpu/opencpu-2.2
sudo apt-get update 
sudo apt-get upgrade
```
Installs OpenCPU server

`sudo apt-get install -y opencpu-server`

Done! Open http://yourhost/ocpu in your browser



## System level preparation

In order to instal RCurl pacakge in R, you need to install curl on Linux system first

`sudo apt -y install libcurl4-openssl-dev`

In order to do rmarkdown by opencpu, an pandoc on system level needs to be installed.

`sudo apt-get install -y pandoc pandoc-citeproc`

Then start R as root 

`sudo R`


## Install requuired R pacakges

 Then install R oackages from either CRAN or Github (requries devtools)

```
install.packages(c("RCurl","devtools","ggplot2"，"rmarkdown","pheatmap","dbplyr"，"Data.table","dbplyr"，"dplyr","DT"，"ggforce","ggfortify"，"ggrepel","gplots","Hmisc","plotly","reshape2"，"rrcov","rrcovNA","rrcovNA","shinyjs","shinyWidgets","vegan","scatterplot3d"))

devtools::install_github("talgalili/d3heatmap")

```

## Then install this package rmdocpu

`devtools::install_github("ningzhibin/rmdocpu")`




