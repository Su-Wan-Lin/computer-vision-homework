# -*- coding: utf-8 -*-
import numpy
import random
import matplotlib.pyplot as plt
import pylab


def generate_random_data(size):
    x = [random.uniform(-1, 1) for i in range(size)]
    y = numpy.sign (x)
    for i in range(size):
        if (random.uniform(0,1) <= 0.2):
            y[i] = -y[i]
    return (x, y)


def Decision_stump(x,y):
    size = len(x)
    sorted_x = sorted(x)
    threshold = 0
    s = 1
    E_in_best = size
    threshold_optimal = 0
    for i in range(0,size + 1):
        if i == 0:
            threshold = (-1 + sorted_x[i]) * 0.5
        elif i == size:
            threshold = (sorted_x[i-1] + 1) * 0.5
        else:
            threshold = (sorted_x[i-1] + sorted_x[i]) * 0.5
        error_count = 0
        for k in range(0,size):
            s = -1
            h = s * numpy.sign(x[k] - threshold)
            if (h !=y[k]):
                error_count = error_count + 1
        if (error_count < E_in_best):
            s = -1
            threshold_optimal = threshold
            E_in_best = error_count
        error_count = 0
        for j in range(0,size):
            s = 1
            h = s * numpy.sign(x[j] - threshold)
            if (h != y[j]):
                error_count = error_count + 1
        if (error_count < E_in_best):
            s = 1
            threshold_optimal = threshold
            E_in_best = error_count

            
    return (s,threshold_optimal,E_in_best)
        
            
def E_out_calculate(s,threshold_optimal):
    Err_out = 0.5 + 0.3 * s * (abs(threshold_optimal)-1)
    return Err_out


E_in = 0
E_out = 0
size = 20
repeat = 1000
Histogram_E_in=[]
Histogram_E_out=[]

for i in range(repeat):
    (x,y) = generate_random_data(size)
    (s,threshold_optimal,E_in_best) = Decision_stump(x,y)
    Err_out = E_out_calculate(s,threshold_optimal)
    E_in = E_in + E_in_best
    E_out = E_out + Err_out
    Histogram_E_in.append(E_in_best)
    Histogram_E_out.append(Err_out)
E_in_average = E_in/repeat
E_out_average = E_out/repeat


print x
print y
print s
print ("threshold: ", threshold_optimal)
print ("Ein: ", E_in_average)
print ("Eout: ", E_out_average)

pylab.bar(range(len(Histogram_E_in)), Histogram_E_in)
pylab.show()
pylab.bar(range(len(Histogram_E_out)), Histogram_E_out)
pylab.show()










