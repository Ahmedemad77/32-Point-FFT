# -*- coding: utf-8 -*-
"""
Created on Tue Apr 12 19:02:47 2022

@author: SMART
"""
#fixed point function Quantize the float point to specified precison i.e if 0.75 is given with 1 precision then 0.5 is the output

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