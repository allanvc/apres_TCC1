### html widgets for Apres_TCC1
#1) grafico interativo plotly:
library(htmlwidgets)

n=99
d1<-matrix(rnorm(n,mean=-7,sd=1), n/3, 3)
d2<-matrix(rnorm(n,mean=0,sd=1), n/3, 3)
d3<-matrix(rnorm(n,mean=7,sd=1), n/3, 3)

d<-rbind(d1,d2,d3)
pca<-princomp(d)

str(pca)

mx<-min(pca$scores[,1]) # menor valor de x no espaço transformado
Mx<-max(pca$scores[,1]) # maior valor de x no espaço transformado

my<-min(pca$scores[,2]) # menor valor de y no espaço transformado
My<-max(pca$scores[,2]) # maior valor de y no espaço transformado

mz<-min(pca$scores[,3]) # menor valor de y no espaço transformado
Mz<-max(pca$scores[,3]) # maior valor de y no espaço transformado

simx<-runif(10*n/3,mx,Mx) # uniforme entre mx e Mx
simy<-runif(10*n/3,my,My) # uniforme entre my e My
simz<-runif(10*n/3,mz,Mz) # uniforme entre my e My

simd<-t(rbind(simx,simy, simz))

simd<-simd %*% t(pca$loadings) + pca$center # transformando para o espaço original



# ANTES NO LINUX PARA FUNCIONAR O PLOTLY:
# sudo apt-get install libssl-dev
# sudo apt-get install libcurl4-openssl-dev
# install.packages("openssl")
# install.packages("libcurl")
# install.packages("curl")
# install.packages("httr")
# install.packages("plotly")
library(plotly)

# PLOT 3D
p <- plot_ly(as.data.frame(d), x = d[,1], y = d[,2], z = d[,3])

# ou melhor (COM LAYERING)
# https://plot.ly/r/graphing-multiple-chart-types/
p <- plot_ly(as.data.frame(d)) %>%
  add_trace(x = d[,1], y = d[,2], z = d[,3])

p <- p %>% add_trace(x = simd[,1], y = simd[,2], z = simd[,3])
# ok! funcionou! eh soh ir clicando para ativar o trace!!!

saveWidget(as_widget(p), file = "hipercube_plot.html")


#2) tabela resultados

tab <- data.frame("M"=rep(100,5), "n1" = c(32,15,50,50,100), "n2" = c(29,13,65,65,80),
                  "mean1"=c(-3, rep(-1,4)), "mean2"=rep(1,5), "sd1"=c(.4,.3,1,.7,.5),
                  "sd2"=c(.4,.3,1,.7,.7), "acerto"=c('TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE'))

tab

tablecode <- function(df, tabletype="gridtable"){
  tmp <- noquote(apply(df, 1, function(x) paste0("<td data-th='", sprintf("%s",colnames(df)), "'>", x, "</td>", collapse=" ")))
  
  cat(
    c(
      noquote(paste0("<table id='", tabletype,"' style='width:100%'> ")),    
      noquote(paste0("<tr>", paste0("<th>", sprintf("%s",colnames(df)), "</th>", collapse=" "), "</tr>")),
      noquote(unlist(lapply(tmp, function(x) paste0("<tr>", x, "</tr>")))),
      noquote("</table>")
    )
  )
  
}
# sol em: http://psych-git.github.io/table1.html#/slide-18



# segundo gráfico interativo plotly:
#1) grafico interativo plotly:
library(htmlwidgets)

n=66
d1<-matrix(rnorm(n,mean=-2,sd=.3), n/2, 2)
d2<-matrix(rnorm(n,mean=1,sd=.4), n/2, 2)
# d3<-matrix(rnorm(n,mean=7,sd=1), n/3, 3)

d<-rbind(d1,d2)
pca<-princomp(d)

str(pca)

mx<-min(pca$scores[,1]) # menor valor de x no espaço transformado
Mx<-max(pca$scores[,1]) # maior valor de x no espaço transformado

my<-min(pca$scores[,2]) # menor valor de y no espaço transformado
My<-max(pca$scores[,2]) # maior valor de y no espaço transformado

# mz<-min(pca$scores[,3]-0.5) # menor valor de y no espaço transformado
# Mz<-max(pca$scores[,3]+0.5) # maior valor de y no espaço transformado

simx<-runif(33*5,mx,Mx) # uniforme entre mx e Mx
simy<-runif(33*5,my,My) # uniforme entre my e My
#simz<-runif(33,mz,Mz) # uniforme entre my e My

#simd<-t(rbind(simx,simy, simz))
simd<-t(rbind(simx,simy))

simd<-simd %*% t(pca$loadings) + pca$center # transformando para o espaço original

# capturando o centroide:
outd<- kmeans(d, centers=2)
centd <- outd$centers
centd

outsim <- kmeans(simd, centers=2)
centsim <- outsim$centers
centsim
help(kmeans)



# ANTES NO LINUX PARA FUNCIONAR O PLOTLY:
# sudo apt-get install libssl-dev
# sudo apt-get install libcurl4-openssl-dev
# install.packages("openssl")
# install.packages("libcurl")
# install.packages("curl")
# install.packages("httr")
# install.packages("plotly")
library(plotly)

# PLOT 3D
# p <- plot_ly(as.data.frame(d), x = d1[,1], y = d1[,2], z = d1[,3])

# ou melhor (COM LAYERING)
# https://plot.ly/r/graphing-multiple-chart-types/
p2 <- plot_ly(as.data.frame(d)) %>%
  add_trace(x = d[,1], y = d[,2], size = I(4))

p2 <- p2 %>% add_trace(x = simd[,1], y = simd[,2], size = I(4))
# ok! funcionou! eh soh ir clicando para ativar o trace!!!


# centroides:
p2 <- p2 %>% add_markers(x =centd[2,2], y=centd[2,1], size = I(8))
p2 <- p2 %>% add_markers(x =centd[1,1], y=centd[1,2], size = I(8))

p2 <- p2 %>% add_markers(x =centsim[2,1], y=centsim[2,2], size = I(8))
p2 <- p2 %>% add_markers(x =centsim[1,1], y=centsim[1,2], size = I(8))



# # segmentos: --> soh funciona em duas dimensesões
# ants coloando o resultado dos clusters:
# dc <- d1
# 
# dc<-rbind(dc, outd$cluster)

p2 <- p2 %>% add_segments(x = centd[1,1], xend = d1[,1],
                        y = centd[1,2], yend = d1[,2],
                        alpha = 0.3, size = I(2))

p2 <- p2 %>% add_segments(x = centd[2,2], xend = d2[,1],
                          y = centd[2,1], yend = d2[,2],
                          alpha = 0.3, size = I(2))


## recuperando classificacao do cubo:
simdc <- cbind(simd, outsim$cluster)
str(simdc)
simdc1 <- simd[simdc[,3] == 1,]
simdc2 <- simd[simdc[,3] == 2,]


p2 <- p2 %>% add_segments(x = centsim[1,1], xend = simdc1[,1],
                          y = centsim[1,2], yend = simdc1[,2],
                          alpha = 0.3, size = I(2))

p2 <- p2 %>% add_segments(x = centsim[2,1], xend = simdc2[,1],
                          y = centsim[2,2], yend = simdc2[,2],
                          alpha = 0.3, size = I(2))


# 
# 
# p <- p %>% add_markers(x =centsim[1], y=centsim[2], z=centsim[3], size = 1.2, hoverinfo = "text", size = I(4))
# 
# help(add_markers)

saveWidget(as_widget(p2), file = "withinss_cube_plot.html")


