import pandas as pd
from keras.models import Sequential
from keras.layers import Dense
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.preprocessing import StandardScaler
from sklearn.compose import make_column_transformer

dataset = pd.read_csv("Credit2.csv", sep=";")
dataset

#separação dos variáveis, ignoro primeira pois não tem valor semântico
x = dataset.iloc[:,1:10].values
y = dataset.iloc[:, 10].values
x

#label encoder coluna checking_status e atribui valores de zero a 3
labelencoder = LabelEncoder()
x[:,0] = labelencoder.fit_transform(x[:,0])
x

#onehotencoder
onehotencoder = make_column_transformer((OneHotEncoder(categories='auto', sparse=False), [1]), remainder="passthrough")
x = onehotencoder.fit_transform(x)
x

#Excluimos a variável para evitar a dummy variable trap
x = x[:,1:]
x

#Laber encoder com a classe
labelencoder_Y = LabelEncoder()
y = labelencoder_Y.fit_transform(y)
y

#separação em treino e teste
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 0.2, random_state = 0)

#feature Scalling, Padronização z-score
sc = StandardScaler()
x_train = sc.fit_transform(x_train)
x_test = sc.transform(x_test)
x_test

classifier = Sequential()
classifier.add(Dense(units = 6, kernel_initializer = 'uniform', activation = 'relu', input_dim = 12))
classifier.add(Dense(units = 6, kernel_initializer = 'uniform', activation = 'relu'))
classifier.add(Dense(units = 1, kernel_initializer = 'uniform', activation = 'sigmoid'))
classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])
classifier.fit(x_train, y_train, batch_size = 10, epochs = 1000)

y_pred = classifier.predict(X_test)
y_pred = (y_pred > 0.5)
y_pred

#matriz de confusão
cm = confusion_matrix(y_test, y_pred)
cm