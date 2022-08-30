pkg <- function(pkg){
   new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
   if (length(new.pkg))
      install.packages(new.pkg, dependencies = TRUE)
   sapply(pkg, require, character.only = TRUE)
}
packages <- c("tidyverse", "raster","sf","cluster", "factoextra",
              "NbClust","tidyr", "forecast", "semPlot", "semTools", "corrplot", "corrr",
              "haven", "psych", "dplyr", "lavaan", "readr", "cvms","tm","NLP",
              "SnowballC","RColorBrewer","wordcloud","wordcloud2", "RefManageR",
              "bibliometrix","GGally","quanteda","ggplot2", "ggpubr",
              "Factoshiny","VGAM")
pkg(packages)
ANTESS=ANTES
A=Subdata[-46,]
sexo=c('Masculino', 'Femenino')
#ANTES
A%>% 
   filter(SD_Sexo %in% sexo) %>%
   ggplot() +
   aes(SD_EdadEnElDesplazamiento, `SD_NumHij@sAD`, jitter=SD_EdadEnElDesplazamiento, shape= `SD_NumHij@sAD`) +
   geom_point(alpha= 0.5, aes(color= `SD_NumHij@sAD`))+
   facet_grid(sexo)+
   labs(x = "Total cites", y = "Document type")


## hijos vs Edad antes del desplazamiento
Fig1A=A%>% 
   ggplot() +
   aes(SD_EdadEnElDesplazamiento,`SD_NumHij@sAD`) +
   geom_point(alpha= 0.5)+
   labs(x = "Age when displaced", y = "Number of children")
## hijos vs Edad after del desplazamiento
Fig1B=A%>% 
   ggplot() +
   aes(SD_EdadActual,`SD_NumHij@sDD`) +
   geom_point(alpha= 0.5)+
   labs(x = "Age after displaced", y = "Number of children after displaced")

ggarrange (Fig1A, Fig1B, labels = c("A", "B"), ncol = 2, nrow = 1)
plot(Fig1A)



#bibliografia:
#STRIPCHARTS -> https://r-coder.com/stripchart-en-r/
#Boxplots -> https://r-coder.com/boxplot-en-r/
#Multiples graficas -> https://r-charts.com/es/r-base/combinar-graficos/
#Graficos de dispercion -> https://r-coder.com/grafico-dispersion-r/
#Graficos de barras -> https://r-coder.com/grafico-barras-r/
# correlaciones -> https://r-coder.com/grafico-correlacion-r/