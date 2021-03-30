# Opencpu server package for metalab result report


## install opencpu first

Requires Ubuntu 20.04 (Focal) or 18.04 (Bionic)

`sudo add-apt-repository -y ppa:opencpu/opencpu-2.2`

`sudo apt-get update `

`sudo apt-get upgrade`

Installs OpenCPU server

`sudo apt-get install -y opencpu-server`

Done! Open http://yourhost/ocpu in your browser



## RCurl package, 
in order to instal that, you need to install curl on Linux system first

`sudo apt -y install libcurl4-openssl-dev`

then in R as root (sudo R)

`install.packages("RCurl")`

## Other R pacakges


* Then install R oackages from either CRAN or Github (requries devtools)

`install.packages("devtools")`

`install.packages(“ggplot2”)`

`install.packages(“rmarkdown”)`

`install.packages(“pheatmap”)`

`devtools::install_github("talgalili/d3heatmap")`


`install.packages("dbplyr")`

`install.packages("Data.table")`

`install.packages("dbplyr")`

`install.packages("dplyr")`

`install.packages("DT")`

`install.packages("ggforce")`

`install.packages("ggfortify")`

`install.packages("ggrepel")`

`install.packages("gplots")`

`install.packages("Hmisc")`

`install.packages("plotly")`

`install.packages("reshape2")`

`install.packages("rrcov")`

`install.packages("rrcovNA")`

`install.packages("shinyjs")`

`install.packages("shinyWidgets")`


## Then install 

`devtools::install_github("ningzhibin/rmdocpu")`



