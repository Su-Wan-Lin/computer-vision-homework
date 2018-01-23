# -*- coding: utf-8 -*-
import os
import sys
import numpy
import random
import matplotlib.pyplot as plt

def load_data(file_path):
    dataset = open(file_path,'r')
    line_con = dataset.readlines()
    line_num = len(line_con)
    x = numpy.zeros((line_num,5))
    y = numpy.zeros((line_num,1))
    for i in range(9,line_num):
        content = line_con[i].strip('}').strip().strip('\\').split(' ')
        y[i,0] = content[3].split('\t')[1]
        content[3] = content[3].split('\t')[0]
        x[i,0] = 1
        for j in range(0,4):
            x[i,j+1] = content[j]
    return x,y

def PLA(x,y):
    w = numpy.zeros((5,1))
    line_num = len(x)
    count = 0
    predict_y = numpy.zeros((line_num,1))
    x = numpy.mat(x)
    w = numpy.mat(w)
    while(predict_y.all() != y.all()):
        for i in range(line_num):
            matrix_con = x[i,:]*w
            if(matrix_con > 0):
                predict_y[i,0] = 1
            else:
                predict_y[i,0] = -1
            if(predict_y[i,0] != y[i,0]):
                w = w + y[i,0]*x[i,:].T
                count = count+1
    return count
                           
file_path = 'PLA_data.txt'
x,y = load_data(file_path)
line_num1 = len(x)
line_num2 = len(y)
Randomnum = [i for i in range(400)]
repeat = 2000
total = 0
#a = x[9:line_num1,:]
#b = y[9:line_num2,:]
#count = PLA(a,b)
Histogram=[]
for i in range(repeat):
    X = x[9:line_num1,:]
    Y = y[9:line_num2,:]
    numpy.random.shuffle(Randomnum)
    a = X[Randomnum]
    b = Y[Randomnum]
    count = PLA(a,b)
    print(count,'number:',i)
    total = total + count
    Histogram=Histogram+[count]
average = total/repeat
print(average,"average")
plt.hist(Histogram,bins='auto')
plt.xlabel("Number of repeat")
plt.ylabel("Frequency")
plt.savefig('PLA-num.png')
plt.show()


    


