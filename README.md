# Opencpu server package for metalab result report/metereport


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




