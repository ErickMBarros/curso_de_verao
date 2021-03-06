#Script produzido para o curso R para dados biol�gicos
#V curso de ver�o - PPG-ERN
#28-01-2019 a 01-02-2019
#Respons�veis: Erick Barros & Pedro Junger

#An�lise: �ndices de diversidade

library(BiodiversityR)
setwd("C:/Seu-local-de-armazenamento-de-dados")
otu=read.table(file="dados-biol�gicos.txt", header=T, row.names=1, sep="\t", dec=".", na.strings="NA")

#os dados biol�gicos devem conter esp�cies como colunas e s�tios como linhas
otu=t(otu)


#c�lculo da riqueza
rich=diversityresult(otu, y=NULL, level = NULL, factor = NULL,index = "richness", method = "each site", sortit = FALSE, digits = 5)

## "each site" for alfa-diversity; "pooled" for gamma-diversity
# H' -> indice de diversidade de Shannon
# J' -> indice de equitabilidade de Pielou
H=diversityresult(otu, y=NULL, level = NULL, factor = NULL,index = "Shannon", method = "each site", sortit = FALSE, digits = 5)
J=diversityresult(otu, y=NULL, level = NULL, factor = NULL,index = "Jevenness", method = "each site", sortit = FALSE, digits = 5)

# S' -> indice de diversidade de Simpson
# E' -> indice de equitabilidade de Hill
S=diversityresult(otu, y=NULL, level = NULL, factor = NULL,index = "Simpson", method = "each site", sortit = FALSE, digits = 5)
E=diversityresult(otu, y=NULL, level = NULL, factor = NULL,index = "Eevenness", method = "each site", sortit = FALSE, digits = 5)

# estimadores de diversidade Jacknife, Chao e Bootstrap
jack=diversityresult(otu, y=NULL, level = NULL, factor = NULL,index = "jack1", method = "pooled", sortit = FALSE, digits = 5)
chao=diversityresult(otu, y=NULL, level = NULL, factor = NULL,index = "chao", method = "pooled", sortit = FALSE, digits = 5)
boot=diversityresult(otu, y=NULL, level = NULL, factor = NULL,index = "boot", method = "pooled", sortit = FALSE, digits = 5)

#junta todos os dados obtidos em uma unica tabela
results=cbind(rich,H,J,S,E)

#salvar tabela como arquivo txt
write.table(results,"div.txt")
