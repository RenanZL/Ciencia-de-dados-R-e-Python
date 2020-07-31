install.packages("tm")
install.packages("textreadr")
install.packages("wordcloud")
install.packages("RColorBrewer")
library(tm)
library(textreadr)
library(wordcloud)
library(RColorBrewer)

#criando o corpus
#fontes disponiveis
getSources()
#formatos
getReaders()
#criar corpus PCorpus() : fisico, VCorpus() : volatil em memoria
#pegando dados da wikipedia
x = read_html("https://en.wikipedia.org/wiki/Artificial_intelligence")
#gerando um corpus
corpus = VCorpus(VectorSource(x),readerControl = list(reader=readPlain, language = "eng"))

#explorando o corpus
inspect(corpus)
inspect(corpus[1:100])
meta(corpus[[1]])
inspect(corpus[[2]])
as.character(corpus[[2]])
as.character(corpus[[200]])[1]

#tratamentos diversos
stopwords("portuguese")
#removendo stopwords
corpus = tm_map(corpus, removeWords, stopwords("english"))
#removendo espaços em branco
corpus = tm_map(corpus, stripWhitespace)
#removendo pontuações
corpus = tm_map(corpus, removePunctuation)
#numeros
corpus = tm_map(corpus, removeNumbers)

#primeiro wordcloud
wordcloud(corpus,max.words = 50, random.order = T, colors = rainbow(8), rot.per=0.5, use.r.layout =T)

#matriz de palavras frequentes
freq = TermDocumentMatrix(corpus)
freq
matriz = as.matrix(freq)
matriz = sort(rowSums(matriz),decreasing = TRUE)
matriz = data.frame(word=names(matriz),freq=matriz)
head(matriz, n=100)
findFreqTerms(freq, 0.5)
#gerando nova nuvem de palavras
wordcloud(matriz$word, matriz$freq,max.words = 50, random.order = T, colors=rainbow(8),rot.per=0.5,use.r.layout = T)
