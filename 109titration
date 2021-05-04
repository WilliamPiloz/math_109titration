#!/usr/bin/env python3
##
## EPITECH PROJECT, 2020
## B-MAT-200-MPL-2-1-109titration-yanis.labchiri
## File description:
## 109titration.py
##

import sys
import math
import os

def print_help():
    print("USAGE")
    print("     ./109titration file")
    print("DESCRITION")
    print("     file a csv file containing “vol;ph” lines")
    exit(0)

def main():
    size = 0
    if (len(sys.argv) != 2):
        exit(84)
    if (len(sys.argv) == 2 and sys.argv[1] == "-h"):
        print_help()
    if (os.path.isfile(sys.argv[1]) == False):
        exit (84);
    string = open(sys.argv[1], 'r')
    tmp = open(sys.argv[1], 'r')
    for i in tmp:
        size += 1
    if size == 0:
        exit (84)
    try :
        parthing(string, size)
    except ValueError:
        exit (84)
    string.close
    tmp.close

def line_handler(a):
    if a.find(";") == -1:
        exit (84)

def parthing(string, size):
    index = 0
    x = [0] * size
    y = [0] * size
    for a in string:
        if (len(a) == 0):
            exit(84)
        line_handler(a)
        res = a.split(";")
        res[1] = res[1].rstrip("\n")
        x[index] = float(res[0])
        if x[index] < 0:
            exit (84)
        y[index] = float(res[1])
        if y[index] < 0 or y[index] > 14:
            exit (84)
        index += 1
    deriv_1(x, y)

def deriv_1(x, y):
    deriv = []
    print("Derivative:")
    tmp = 0
    index = 0
    try :
        for i in range(1, len(x) - 1):
            backward = (y[i] - y[i - 1]) / (x[i] - x[i - 1])
            forward = (y[i + 1] - y[i]) / (x[i + 1] - x[i])
            central = backward * (x[i+1] - x[i]) / (x[i+1] - x[i-1]) + forward * (x[i] - x[i - 1]) / (x[i+1] - x[i-1])
            if (central > tmp):
                tmp = central
                index = i
            deriv.append(central)
            print(x[i], "ml ->", "{:.2f}".format(central))
    except ZeroDivisionError:
        exit (84)
    print("\nEquivalence point at", x[index], "ml\n")
    try :
        deriv_2(x, y, deriv)
    except ZeroDivisionError:
        exit (84)

def deriv_2(x, y, derive):
    print("Second derivative:")
    res_estimated = []
    xbis = []
    index = 0
    tmp = 100000
    tmp2 = 0
    center = 0
    for i in range(1, len(x)):
        xbis.append(x[i])
    for i in range(1, len(xbis) - 2):
        tmp2 = center
        br = (derive[i] - derive[i-1]) / (xbis[i] - xbis[i-1])
        fr = (derive[i+1] - derive[i]) / (xbis[i+1] - xbis[i])
        center = (br * (xbis[i+1] - xbis[i])) / (xbis[i+1] - xbis[i-1]) + (fr * (xbis[i] - xbis[i-1])) / (xbis[i+1] - xbis[i-1])
        print(xbis[i], "ml ->", "{:.2f}".format(center))
        res_estimated.append(center)
        tmp = center
        if tmp <= 0 and tmp2 >= 0:
            tmp *= -1
            if tmp < tmp2:
                index = i
            else :
                index = i - 1
    print("\nSecond derivate estimated:")
    print(xbis[index - 1], "ml ->", "{:.2f}".format(res_estimated[index - 2]))
    equivalence = 1000
    i_equivalence = 0
    i = round(xbis[index - 1], 1)
    minn = xbis[index - 1]
    maxx = xbis[index]
    min_r = res_estimated[index - 2]
    max_r = res_estimated[index - 1]
    tmp = i + 0.1
    while (i < xbis[index] - 0.1):
        result = (min_r * (maxx - tmp)/(maxx-minn)) + (max_r * (tmp - minn)/ (maxx-minn))
        tmp += 0.1
        i += 0.1
        i = round(i, 1)
        print("{:.1f}".format(i), "ml ->", "{:.2f}".format(result))
        if (result < 0):
            result *= -1
        if (equivalence > result):
            i_equivalence = i
            equivalence = result
    result = (min_r * (maxx - tmp)/(maxx-minn)) + (max_r * (tmp - minn)/ (maxx-minn))
    tmp += 0.1
    i += 0.1
    i = round(i, 1)
    if round(result, 1) == -0.0:
        result = 0.0
    print("{:.1f}".format(i), "ml ->", "{:.2f}".format(result))
    if (result < 0):
        result *= -1
    if (equivalence > result):
        i_equivalence = i
        equivalence = result
    i = xbis[index]
    minn = xbis[index]
    maxx = xbis[index + 1]
    min_r = res_estimated[index - 1]
    max_r = res_estimated[index]
    tmp = i + 0.1
    while(i < xbis[index + 1] - 0.1):
        result = (min_r * (maxx - tmp)/(maxx-minn)) + (max_r * (tmp - minn)/ (maxx-minn))
        tmp += 0.1
        i += 0.1
        print("{:.1f}".format(i), "ml ->", "{:.2f}".format(result))
        if (result < 0):
            result *= -1
        if (equivalence > result):
            i_equivalence = i
            equivalence = result
    if round(i, 1) != xbis[index + 1]:
        result = (min_r * (maxx - tmp)/(maxx-minn)) + (max_r * (tmp - minn)/ (maxx-minn))
        tmp += 0.1
        i += 0.1
        i = round(i, 1)
        if round(result, 1) == -0.0:
            result = 0.0
        print("{:.1f}".format(i), "ml ->", "{:.2f}".format(result))
    print("\nEquivalence point at", "{:.1f}".format(i_equivalence), "ml")

main()
