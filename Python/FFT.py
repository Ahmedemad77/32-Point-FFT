# -*- coding: utf-8 -*-
"""
Created on Sun May  8 11:35:40 2022

@author: SMART
"""
import sys
import QuantizeFunction as qf
import numpy as np
import math
import representations_funcs as rf


sys.path.insert(1, 'F:\GP\WinoGrad Convolution\Python')
sys.path.insert(1, 'F:\GP\Pyhon\TestingModel')

length = 32
arr_real = np.zeros(length)
arr_imag = np.zeros(length)

for i in range (length) :
    arr_real[i] =  math.cos(math.radians( ((360/length)*i) ) )
    arr_imag[i] = -math.sin(math.radians( ((360/length)*i) ) )

Constants_File = "Constants_File.txt"
with open(f"{Constants_File}", "w") as txt_file:
    for i in range(int(length/2)):
        txt_file.write(f'{rf.float2fix_complement(arr_real[i], 16, 8)}\n')
        txt_file.write(f'{rf.float2fix_complement(arr_imag[i], 16, 8)}\n')
input_list_File = "Input_File.txt"        
input_list = np.arange(32)
with open(f"{input_list_File}", "w") as txt_file:
    for i in range(int(length)):
        txt_file.write(f'{rf.float2fix_complement(input_list[i], 16, 8)}\n')

arr_real[i] =  qf.num2fixpt(arr_real[i],32,16)
arr_imag[i] =  qf.num2fixpt(arr_imag[i],32,16)


