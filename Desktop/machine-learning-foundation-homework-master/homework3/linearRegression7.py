#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Fri Dec 22 14:01:12 2017

@author: suwanlin
"""

import numpy as np
import matplotlib.pyplot as plt


def generate_random_data(size):
    x1 = np.random.uniform(-1, 1, size)
    x2 = np.random.uniform(-1, 1, size)
    X = np.c_[np.ones((size, 1)), x1, x2]
    Y = np.sign(np.power(x1,2) + np.power(x2,2) - 0.6)
    for i in range (size):
        if (np.random.uniform(0,1) <= 0.1):
            Y[i] = -Y[i]
    return (X,Y)

def Z_transform(X):
    x1x2 = X[:, 1]*X[:, 2]
    x1x1 = X[:, 1]*X[:, 1] 
    x2x2 = X[:, 2]*X[:, 2] 
    Z = np.c_[X, x1x2, x1x1, x2x2]
    return (Z)
    
size = 1000
(X,Y) = generate_random_data(size)
Z = Z_transform(X)
Wlin = np.linalg.pinv(Z.T.dot(Z)).dot(Z.T).dot(Y)

err_count = 0
err_sum = 0
err_avg = 0
E_out=[]
for i in range(size):
    (X1,Y1) = generate_random_data(size)
    Z1 = Z_transform(X1)
    h = np.sign(Z1.dot(Wlin.T))
    err_count = 0
    for j in range(size):
        if (h[j] != Y1[j] ):
            err_count = err_count + 1 
    err_sum = err_sum + err_count
    err_avg = err_sum /size
    E_out = E_out + [err_count]

    
#print X
#print Y
#print Z
#print Wlin
#print h
#print err_count
print err_sum
print err_avg
#print E_out
plt.plot(E_out)
plt.title("E_out")
plt.xlabel("number_of_round")
plt.ylabel("error_number")
plt.savefig('li_re_err.jpg')
plt.show()
plt.hist(E_out,bins='auto')
plt.title("E_out")
plt.xlabel("error_number")
plt.ylabel("number_of_round")
plt.savefig('li_re_hist.jpg')
plt.show()
