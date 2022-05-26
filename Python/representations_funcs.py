# -*- coding: utf-8 -*-
"""
Created on Sat Apr 24 22:45:04 2021

@author: ahmed
"""
import struct
import numpy as np

def binary(num):
    return ''.join(bin(int(c)).replace('0b', '').rjust(8, '0') for c in struct.pack('!f', num))


def binary_discribtion(num):
    # Struct can provide us with the float packed into bytes. The '!' ensures that
    # it's in network byte order (big-endian) and the 'f' says that it should be
    # packed as a float. Alternatively, for double-precision, you could use 'd'.
    packed = struct.pack('!f', num)
    print ('Packed: %s' % repr(packed))

    # For each character in the returned string, we'll turn it into its corresponding
    # integer code point
    # 
    # [62, 163, 215, 10] = [ord(c) for c in '>\xa3\xd7\n']
    integers = [int(c) for c in packed]
    print ('Integers: %s' % integers)

    # For each integer, we'll convert it to its binary representation.
    binaries = [bin(i) for i in integers]
    print ('Binaries: %s' % binaries)

    # Now strip off the '0b' from each of these
    stripped_binaries = [s.replace('0b', '') for s in binaries]
    print ('Stripped: %s' % stripped_binaries)

    # Pad each byte's binary representation's with 0's to make sure it has all 8 bits:
    #
    # ['00111110', '10100011', '11010111', '00001010']
    padded = [s.rjust(8, '0') for s in stripped_binaries]
    print ('Padded: %s' % padded)

    # At this point, we have each of the bytes for the network byte ordered float
    # in an array as binary strings. Now we just concatenate them to get the total
    # representation of the float:
    return ''.join(padded)

def float2fix_complement(val, width, precision):
    integer = abs(int(val * 2 ** precision))
    if integer == 0:
        fix_str = bin(0).replace('0b', '').rjust(width,'0')
    else:
        if val >= 0:
            fix_str = bin(integer).replace('0b', '').rjust(width, '0')
        else:
            integer = 2 ** (width-1) - integer
            fix_str = '1'+bin(integer).replace('0b', '').rjust(width-1, '0')
    return fix_str

def padding(pad_xoffset, pad_yoffset, refrerance_arr, input_array):
    result = np.zeros_like(refrerance_arr)
    x_offset = pad_xoffset  # 0 would be what you wanted
    y_offset = pad_yoffset  # 0 in your case
    result[x_offset:input_array.shape[0]+x_offset,y_offset:input_array.shape[1]+y_offset] = input_array
    return result


# Returns the Binary number corresponding to the float  
def float_to_fp(num,integer_precision,fraction_precision):   
    if(num<0):
        sign_bit = 1                                          #sign bit is 1 for negative numbers in 2's complement representation
        num = -1*num
    else:
        sign_bit = 0
    precision = '0'+ str(integer_precision) + 'b'
    integral_part = format(int(num),precision)
    fractional_part_f = num - int(num)
    fractional_part = []
    for i in range(fraction_precision):
        d = fractional_part_f*2
        fractional_part_f = d -int(d)        
        fractional_part.append(int(d))
    fraction_string = ''.join(str(e) for e in fractional_part)
    if(sign_bit == 1):
        binary = str(sign_bit) + twos_comp(integral_part + fraction_string,integer_precision,fraction_precision)
    else:
        binary = str(sign_bit) + integral_part+fraction_string
    return str(binary)
def twos_comp(val,integer_precision,fraction_precision):
    flipped = ''.join(str(1-int(x))for x in val)
    length = '0' + str(integer_precision+fraction_precision) + 'b'
    bin_literal = format((int(flipped,2)+1),length)
    return bin_literal    


#fixed point function
#used to quantize the input 
import numpy as np
def num2fixpt(num,bits,fraction):
    #time1 = time.time()
    max=(2**(bits-fraction))-1
    sign=(2**(bits-fraction-1))-1
    if type(num)==int or type(num)==float:
        
        integ=np.floor(num)
        if integ>=0:

            if integ>sign:
                if np.floor(integ/(sign+1))%2==0:
                    integer=integ-(max*np.floor(integ/(2*(sign+1))))-(np.floor(integ/(sign+1))/2)
                else:
                    integer=integ-((sign+1)*(np.floor(integ/(sign+1))+1))
            else:
                integer=integ
            fractionalbits = (1 << fraction)
            fract=np.floor(num*fractionalbits)/float(fractionalbits)
            fractional=fract-integ                
            return integer+fractional
        else:

            if integ<sign:
                if np.floor(integ/(sign+1))%2==0:
                      integer=integ-(max*np.floor(integ/(2*(sign+1))))-(np.floor(integ/(sign+1))/2)
                else:
                       integer=integ-((sign+1)*(np.floor(integ/(sign+1))+1))
            else:
                  integer=integ
            fractionalbits = (1 << fraction)
            fract=np.floor(num*fractionalbits)/float(fractionalbits)
            fractional=fract-integ
            #time2 = time.time()
            #print(time2-time1)
            return integer+fractional
    elif len(num.shape)==4:
        out=np.zeros(num.shape)
        for s in range(num.shape[0]):
            for m in range(num.shape[1]):
                for e in range(num.shape[2]):
                    for q in range(num.shape[3]):
                        integ=np.floor(num[s,m,e,q])
                        if integ>=0:
    
                            if integ>sign:
                                if np.floor(integ/(sign+1))%2==0:
                                    integer=integ-(max*np.floor(integ/(2*(sign+1))))-(np.floor(integ/(sign+1))/2)
                                else:
                                    integer=integ-((sign+1)*(np.floor(integ/(sign+1))+1))
                            else:
                                integer=integ
                            fractionalbits = (1 << fraction)
                            fract=np.floor(num[s,m,e,q]*fractionalbits)/float(fractionalbits)
                            fractional=fract-integ
                            
                            out[s,m,e,q]=integer+fractional
                        else:

                            if integ<sign:
                                if np.floor(integ/(sign+1))%2==0:
                                    integer=integ-(max*np.floor(integ/(2*(sign+1))))-(np.floor(integ/(sign+1))/2)
                                else:
                                    integer=integ-((sign+1)*(np.floor(integ/(sign+1))+1))
                            else:
                                integer=integ
                            fractionalbits = (1 << fraction)
                            fract=np.floor(num[s,m,e,q]*fractionalbits)/float(fractionalbits)
                            fractional=fract-integ
                            out[s,m,e,q]= integer+fractional
        #time2 = time.time()
        #print(time2-time1)
        return out
    elif len(num.shape)==3:
        out=np.zeros(num.shape)
        for s in range(num.shape[0]):
            for m in range(num.shape[1]):
                
                for e in range(num.shape[2]):
                    
                    integ=np.floor(num[s,m,e])
                    if integ>=0:
                        if integ>sign:
                            
                            if np.floor(integ/(sign+1))%2==0:
                                integer=integ-(max*np.floor(integ/(2*(sign+1))))-(np.floor(integ/(sign+1))/2)
                            else:
                                integer=integ-((sign+1)*(np.floor(integ/(sign+1))+1))
                        else:
                            integer=integ
                        fractionalbits = (1 << fraction)
                        fract=np.floor(num[s,m,e]*fractionalbits)/float(fractionalbits)
                        fractional=fract-integ
                        
                        out[s,m,e]=integer+fractional
                    else:

                        if integ<sign:
                            if np.floor(integ/(sign+1))%2==0:
                                integer=integ-(max*np.floor(integ/(2*(sign+1))))-(np.floor(integ/(sign+1))/2)
                            else:
                                integer=integ-((sign+1)*(np.floor(integ/(sign+1))+1))
                        else:
                            integer=integ
                        fractionalbits = (1 << fraction)
                        fract=np.floor(num[s,m,e]*fractionalbits)/float(fractionalbits)
                        fractional=fract-integ
                        out[s,m,e]= integer+fractional
        #time2 = time.time()
        #print(time2-time1)
        return out
    elif len(num.shape)==1:
        out=np.zeros(num.shape)
        for s in range(num.shape[0]):
                    
                    integ=np.floor(num[s])
                    if integ>=0:
                        if integ>sign:
                            
                            if np.floor(integ/(sign+1))%2==0:
                                integer=integ-(max*np.floor(integ/(2*(sign+1))))-(np.floor(integ/(sign+1))/2)
                            else:
                                integer=integ-((sign+1)*(np.floor(integ/(sign+1))+1))
                        else:
                            integer=integ
                        fractionalbits = (1 << fraction)
                        fract=np.floor(num[s]*fractionalbits)/float(fractionalbits)
                        fractional=fract-integ
                        
                        out[s]=integer+fractional
                    else:

                        if integ<sign:
                            if np.floor(integ/(sign+1))%2==0:
                                integer=integ-(max*np.floor(integ/(2*(sign+1))))-(np.floor(integ/(sign+1))/2)
                            else:
                                integer=integ-((sign+1)*(np.floor(integ/(sign+1))+1))
                        else:
                            integer=integ
                        fractionalbits = (1 << fraction)
                        fract=np.floor(num[s]*fractionalbits)/float(fractionalbits)
                        fractional=fract-integ
                        out[s]= integer+fractional
        #time2 = time.time()
        #print(time2-time1)
        return out
    
    elif len(num.shape)==2:
        out=np.zeros(num.shape)
        for s in range(num.shape[0]):
            for m in range(num.shape[1]):
                                    
                    integ=np.floor(num[s,m])
                    if integ>=0:
                        if integ>sign:
                            
                            if np.floor(integ/(sign+1))%2==0:
                                integer=integ-(max*np.floor(integ/(2*(sign+1))))-(np.floor(integ/(sign+1))/2)
                            else:
                                integer=integ-((sign+1)*(np.floor(integ/(sign+1))+1))
                        else:
                            integer=integ
                        fractionalbits = (1 << fraction)
                        fract=np.floor(num[s,m]*fractionalbits)/float(fractionalbits)
                        fractional=fract-integ
                        
                        out[s,m]=integer+fractional
                    else:

                        if integ<sign:
                            if np.floor(integ/(sign+1))%2==0:
                                integer=integ-(max*np.floor(integ/(2*(sign+1))))-(np.floor(integ/(sign+1))/2)
                            else:
                                integer=integ-((sign+1)*(np.floor(integ/(sign+1))+1))
                        else:
                            integer=integ
                        fractionalbits = (1 << fraction)
                        fract=np.floor(num[s,m]*fractionalbits)/float(fractionalbits)
                        fractional=fract-integ
                        out[s,m]= integer+fractional
        #time2 = time.time()
        #print(time2-time1)
        return out

def float2fix_signbit(val, width, precision):
    integer = abs(int(val * 2 ** precision))
    if val < 0:
        val = abs(val)
        integer = abs(int(val * 2 ** precision))
    if val >= 0:
        fix_str = bin(integer).replace('0b', '').rjust(width, '0')
    else:
        fix_str = '1'+bin(integer).replace('0b', '').rjust(width-1, '0')
    return fix_str	