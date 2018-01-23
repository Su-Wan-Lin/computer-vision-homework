#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon Dec 25 13:50:42 2017

@author: suwanlin
"""

import numpy as np
import matplotlib.pyplot as plt

def load_data(file_path):
    dataset = open(file_path,'r')
    line_con = dataset.readlines()
    line_num = len(line_con)
    x = np.zeros((line_num,20))
    y = np.zeros((line_num,1))
    for i in range(0, line_num):
        content = line_con[i].strip('\n').strip(' ').split(' ')
        y[i,0] = content[20]
        for j in range(0,20):
            x[i,j] = content[j]
    return x,y

def logisticRegression_FixedLearningRate(x, y, eta, size):
    x_row, x_col = x.shape
    Wlog = np.zeros((x_col,1))
    err_count = 0 
    E = []
    for i in range(size):
        s = -1 * x.dot(Wlog) * y
        h = 1/(1 + np.exp(-1 * s))
        D_E_in = (-1 * x * y).T.dot(h)/x_col
        Wlog = Wlog - eta * D_E_in
        err_count = error_count(x, y, Wlog)
        E = E + [err_count]
    return err_count,E

def logisticRegression_StochasticGradientDescent(x, y, eta, size):
    x_row, x_col = x.shape
    Wlog = np.zeros((x_col,1))
    err_count = 0
    E = []
    num = 0
    for i in range(size):
        if num >= x_row:
            num = 0
        s = -1 * x[num, :].dot(Wlog) * y[num, 0]    
        h = 1/(1 + np.exp(-1 * s))
        D_E_in = -1 * y[num,0] * x[num: num+1,:].T * h
        Wlog = Wlog - eta * D_E_in
        num = num + 1
        err_count = error_count(x, y, Wlog)
        E = E + [err_count]
    return err_count,E

def error_count(x, y, Wlog):
    err_count = 0 
    y_hat = x.dot(Wlog)
    for i in range(len(y)):
        if (y_hat[i] > 0):
            y_hat[i] = 1
        else:
            y_hat[i] = -1
        if (y_hat[i] != y[i]):
            err_count = err_count + 1
    return err_count


file_path = 'hw3_train_data.txt'
(x_tr,y_tr) = load_data(file_path)
file_path = 'hw3_train_test.txt'
(x_te,y_te) = load_data(file_path)

eta = 0.001
size = 2000
(E_in_f,Eif) = logisticRegression_FixedLearningRate(x_tr, y_tr, eta, size)
(E_out_f,Eof) = logisticRegression_FixedLearningRate(x_te, y_te, eta, size)
(E_in_s,Eis) = logisticRegression_StochasticGradientDescent(x_tr, y_tr, eta, size)
(E_out_s,Eos) = logisticRegression_StochasticGradientDescent(x_te, y_te, eta, size)

#print line_con
#print line_num
#print content
#print y_te
#print x_te
#print Wlog1

#print E_in_f
plt.plot(Eif,'b',Eis,'r')
plt.title("E_in : error_number / number_of_round")
plt.xlabel("number_of_round")
plt.ylabel("error_number")
plt.savefig('lo_re_fs_err_in10.jpg')
plt.show()

#print E_out_f
plt.plot(Eof,'b',Eos,'r')
plt.title("E_out : error_number / number_of_round")
plt.xlabel("number_of_round")
plt.ylabel("error_number")
plt.savefig('lo_re_fs_err_out10.jpg')
plt.show()

