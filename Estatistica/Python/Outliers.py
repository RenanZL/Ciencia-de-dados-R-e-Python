import matplotlib.pyplot as plt
import pandas as pd
from pyod.models.knn import KNN

iris = pd.read_csv('iris.csv')

plt.boxplot(iris.iloc[:,1])
outliers = iris[(iris['sepal width'] > 4.0)]

sepal_width = iris.iloc[:,1]
detector = KNN()
detector.fit(sepal_width)

previsoes = detector.labels_
