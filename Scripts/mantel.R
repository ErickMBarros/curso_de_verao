#Script produzido para o curso R para dados biol�gicos
#V curso de ver�o - PPG-ERN
#28-01-2019 a 01-02-2019
#Respons�veis: Erick Barros & Pedro Junger

#An�lise: Mantel test

library(vegan)
setwd("C:/Seu-local-de-armazenamento-de-dados")

#Criando 
amb=read.table(file="dados-ambientais.txt", header=TRUE, row.names = 1, dec = ".")
geo=read.table(file="dados-geograficos.txt", header=T, row.names=1, dec=".")
otu<-read.table(file="dados-biol�gicos.txt", header=T, row.names=1, sep="\t", dec=".", na.strings="NA")

#caso seja de interesse transformar os dados em abund�ncia relativa
otu=decostand(otu, method ="total", MARGIN = 2)

#os dados biol�gicos devem conter esp�cies como colunas e s�tios como linhas
otu=t(otu)

#criar matriz de dist�ncias para dados ambientais
dist.amb=vegdist(amb[,4], method="euclidean") #� possivel tamb�m utilizar a forma amb$coluna-de-interesse
#para visualizar o resultado � preciso transformar a matriz de dist�ncias para matriz
#dist.amb.visualizar=as.matrix(dist.amb) 

#criar matriz de dist�ncia para dados geogr�ficos
library(fields)
dist.geo=rdist.earth(geo,geo, miles = FALSE)
rownames(dist.geo)=rownames(geo)
colnames(dist.geo)=rownames(geo)

dist.geo[upper.tri(dist.geo, diag=TRUE)]<-""
dist.geo=as.dist(dist.geo)

#criar matriz de dist�ncias para dados biol�gicos
dist.abund <- vegdist(otu, method="bray")

mantel(dist.abund, dist.matrix, method="spear")
