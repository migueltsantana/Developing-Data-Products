FROM rocker/shiny:4.0.4
RUN install2.r rsconnect
WORKDIR /home/shinyusr
COPY ui.R ui.R
COPY server.R server.R
COPY deploy.R deploy.R
CMD Rscript deploy.R
