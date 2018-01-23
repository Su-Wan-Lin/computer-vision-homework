#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu Jan  4 15:54:37 2018

@author: suwanlin
"""

import numpy as np
import matplotlib.pyplot as plt

def load_data(file_path):
    dataset = open(file_path,'r')
    line_con = dataset.readlines()
    line_num = len(line_con)
    x = np.zeros((line_num,3))
    y = np.zeros((line_num,1))
    for i in range(0, line_num):
        content = line_con[i].strip('\n').strip(' ').split(' ')
        y[i,0] = content[2]
        x[i,0] = 1
        for j in range(0,2):
            x[i,j+1] = content[j]
    return x,y

def error_count(x, y, Wreg):
    err_count = 0 
    #count = 0
    y_hat = x.dot(Wreg)
#    Err = []
    for i in range(len(y)):
        if (y_hat[i] >= 0):
            y_hat[i] = 1
        else:
            y_hat[i] = -1
        if (y_hat[i] != y[i]):
            err_count = err_count + 1
    return (err_count*1.0) / len(y)

file_path = 'hw4_train_data.txt'
(x_tr,y_tr) = load_data(file_path)
file_path = 'hw4_train_test.txt'
(x_te,y_te) = load_data(file_path)


c = np.arange(-10.0,3.0)
lamda=10**c
row,column = x_tr.shape

#Wreg = np.linalg.inv(x_tr.T.dot(x_tr) + 10 * np.eye(column)).dot(x_tr.T).dot(y_tr)
#print Wreg
#Ein = error_count(x_tr,y_tr,Wreg) 
#Eout = error_count(x_te,y_te,Wreg) 
#print Ein
#print Eout
E_in = np.zeros(len(c))
E_out = np.zeros(len(c))
for i in range(len(c)):
    Wreg = np.linalg.inv(x_tr.T.dot(x_tr) + lamda[i] * np.eye(column)).dot(x_tr.T).dot(y_tr)
    E_in[i] = error_count(x_tr,y_tr,Wreg)
    E_out[i] = error_count(x_te,y_te,Wreg)
compare = np.c_[lamda,E_in, E_out]
#print E_in
#print E_out
print compare



x = c
y = E_in
plt.plot(x, y)
w = c
z = E_out
plt.plot(w, z)
plt.title("E_in_out")
plt.xlabel("log10(Lamda)")
plt.ylabel("E")
plt.savefig('E_in_out.jpg')
plt.show()





