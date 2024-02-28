def fun(AdcInput,RealResult,ImagResult):
    import numpy as np
    from numpy.fft import fft, ifft
    print('Inside Pyhon')
    Result = fft(AdcInput)
    valid = True
    for i in range (32): 
        if((abs(Result[i].real-RealResult[i])>0.1) or (abs(Result[i].imag-ImagResult[i])>0.1)): 
            print('Error expeted Value is ',Result[i])  
            print('Found Result is ',RealResult[i],'+',ImagResult[i],'j')  
            valid = False
    return valid

