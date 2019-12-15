import data_set
from sklearn.model_selection import train_test_split as tts
import numpy as np
from sklearn.datasets import fetch_olivetti_faces
from sklearn.model_selection import train_test_split as tts
from sklearn.neural_network import MLPClassifier as ANN
from sklearn.metrics import accuracy_score as a_s
from sklearn.metrics import confusion_matrix as c_m
from matplotlib import pyplot as plt
from sklearn.model_selection import KFold
from sklearn.neighbors import KNeighborsClassifier
from sklearn import tree
from sklearn.svm import SVC

def get_metrics(method, x_train, x_test, y_train, y_test):
    trained = method.fit(x_train, y_train)
    y_pred = trained.predict(x_test)
    print(a_s(y_test, y_pred))
    print(c_m(y_test, y_pred))


x_train, x_test, y_train, y_test = tts(data_set.data_set_values(), data_set.target_values(), shuffle=True, test_size=0.5, random_state=42)


print("KNN\n")
method = KNeighborsClassifier(5)
get_metrics(method, x_train, data_set.hard_test_values(), y_train, data_set.hard_test_targets())

print("\n#########################################################\n")

print("Decision Tree\n")
method = tree.DecisionTreeClassifier()
get_metrics(method, x_train, data_set.hard_test_values(), y_train, data_set.hard_test_targets())

print("\n#########################################################\n")

print("\nANN")
method = ANN(solver='lbfgs', hidden_layer_sizes=50)
get_metrics(method, x_train, data_set.hard_test_values(), y_train, data_set.hard_test_targets())

print("\n#########################################################\n")

print("\nSVC")
method = SVC(C=1.0, kernel='poly', degree=3)
get_metrics(method, x_train, data_set.hard_test_values(), y_train, data_set.hard_test_targets())