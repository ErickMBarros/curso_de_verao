#Script produzido para o curso R para dados biol�gicos
#V curso de ver�o - PPG-ERN
#28-01-2019 a 01-02-2019
#Respons�veis: Erick Barros & Pedro Junger

#An�lise:dbRDA

library(vegan)
setwd("C:/Seu-local-de-armazenamento-de-dados")

#Criando 
amb=read.table(file="dados-ambientais.txt", header=TRUE, row.names = 1, dec = ".")
otu<-read.table(file="dados-biol�gicos.txt", header=T, row.names=1, sep="\t", dec=".", na.strings="NA")

#caso seja de interesse transformar os dados em abund�ncia relativa
otu=decostand(otu, method ="total", MARGIN = 2)

#os dados biol�gicos devem conter esp�cies como colunas e s�tios como linhas
otu=t(otu)

#comando para an�lise da RDA
dbRDA=capscale(otu ~ alt+ph+temp+condut+doc+fc+chla, amb, dist="bray") #Sem DIN

#plot do grafico
plot(dbRDA) 
anova(dbRDA)
plot(dbRDA, type="n", xlim = c(-2, 2), ylim = c(-3, 3), ylab="Indique_componente_eixo_y(%)", xlab="Indique_componente_eixo_X(%)")
text(dbRDA, dis="cn", col="indianred3")
points(dbRDA, pch=16, col="black", bg="black", cex=0.8)
text(dbRDA,"sites", col="black", cex=0.4, pos=1)
text("Indique_ANOVA_P=", x=-3, y=3)

#A porcentagem da importancia dos componentes utilizados para os eixos X e Y do grafico 
#s�o apresentados no Summary
summary(dbRDA)