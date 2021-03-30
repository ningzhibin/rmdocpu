
# rebuild and install
devtools::build()
devtools::install()

# start opencpu

library(metalab)
opencpu::ocpu_start_server(port = 5656)


#browseURL("http://")
#rmarkdown::render(input="index.Rmd", output_file="inst/www/index.html")


