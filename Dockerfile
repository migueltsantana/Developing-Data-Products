FROM rocker/shiny:4.0.4
RUN install2.r rsconnect
WORKDIR /home/shinyusr
COPY week4/ui.R ui.R
COPY week4/server.R server.R
COPY week4/deploy.R deploy.R
CMD Rscript deploy.R
RUN R -e "install.packages('RColorBrewer',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggplot2',dependencies=TRUE, repos='http://cran.rstudio.com/')"
