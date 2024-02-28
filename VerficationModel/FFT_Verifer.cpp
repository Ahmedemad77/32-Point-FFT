// This file is compiled as C++ and linked with stdlib
// into the simulation executable.

#include <iostream>
#include <svdpi.h>
#include "C:\\Program Files\\Python312\\include\\Python.h"
#include <vector>

using namespace std;

template<typename T>
PyObject* convertVectorToPythonList(const std::vector<T>& vec) {
    PyObject* pyList = PyList_New(vec.size()); // Create a new Python list
    if (!pyList) {
        PyErr_Print();
        PyErr_SetString(PyExc_RuntimeError, "Failed to create Python list");
        return nullptr;
    }
    // std::cout<<"vec.size() " <<vec.size();
    // Convert each element of the vector to Python objects and append to the list
    for (size_t i = 0; i < vec.size(); ++i) {
        // std::cout<<" vec[i] "<<vec[i];
        double d = (vec[i]);
        PyObject* pyItem = Py_BuildValue("d", d); // Convert to Python float
        PyErr_Print();
        if (!pyItem) {
            Py_DECREF(pyList); // Clean up the list
            PyErr_SetString(PyExc_RuntimeError, "Failed to convert element to Python");
            return nullptr;
        }
        PyList_SET_ITEM(pyList, i, pyItem); // Set the item in the Python list
        PyErr_Print();

    }

    return pyList;
}

PyObject* pModule;
PyObject* pFunc;
extern "C" void init(void){
    Py_Initialize();
    std::cout<<"iNit Is called\n";
    // Run a Python script
    PyRun_SimpleString("print('Hello from Python!')");
    PyRun_SimpleString(
        "def fun(AdcInput,RealResult,ImagResult):\n"
        "\timport numpy as np\n"
        "\tfrom numpy.fft import fft, ifft\n"
        "\tprint('FFT function is called')\n"
        "\tResult = fft(AdcInput)\n"
        "\tvalid = True\n"
        "\tfor i in range (32):\n" 
        "\t\tif(valid and ((abs(Result[i].real-RealResult[i])>0.1) or (abs(Result[i].imag-ImagResult[i])>0.1))):\n" 
        "\t\t\tprint('Error expeted Value is ',Result[i])\n"  
        "\t\t\tprint('Found Result is ',RealResult[i],'+',ImagResult[i],'j')\n"  
        "\t\t\tvalid = False\n"
        "\treturn valid\n"
    );
    // Call the Python function
    pModule = PyImport_AddModule("__main__");
    pFunc = PyObject_GetAttrString(pModule, "fun");

}

extern "C" int FFT_Check_Result(const svOpenArrayHandle ADC_Input,const svOpenArrayHandle Real_Results,const svOpenArrayHandle imag_Results){

    static std::vector<int> input_Vector(32);
    static std::vector<double> real_Vector(32);
    static std::vector<double> imag_Vector(32);
    bool result = 1;
    //Reterive the inputs And the Results From the SV 
    int low = svLow(ADC_Input, 1);
    int high = svHigh(ADC_Input, 1);
    std::cout<<low<<" "<<high<<"\n";
    for(int i=low; i<=high; i++) {
        // printf("%d ", i, );
        input_Vector[i] =  *((int*)svGetArrElemPtr1(ADC_Input, i));
        real_Vector[i] = *((double*)svGetArrElemPtr1(Real_Results, i));
        imag_Vector[i] = *((double*)svGetArrElemPtr1(imag_Results, i));
        std::cout<<i<<" "<<input_Vector[i]<<" "<<real_Vector[i]<<" "<<imag_Vector[i]<<"\n";
    }
    std::cout<<"Finished Reteriving the Data\n";

    
    

        PyErr_Print();

    PyObject* pList1 = convertVectorToPythonList<int>(input_Vector);
        PyErr_Print();

    PyObject* pList2 = convertVectorToPythonList<double>(real_Vector);
        PyErr_Print();

    PyObject* pList3 = convertVectorToPythonList<double>(imag_Vector);
        PyErr_Print();

    std::cout<<"Finished Converting data to pyhon ";
   
    PyObject* pArgs = PyTuple_Pack(3,pList1,pList2,pList3);
    if (!pFunc||!PyCallable_Check(pFunc)) {
        std::cout<<"Can Not reterive Pfunc\n";
        PyErr_Print();
        Py_XDECREF(pFunc);
        Py_DECREF(pModule);
        Py_Finalize();

        return 0;
    }else
    {
        PyObject* pResult = PyObject_CallObject(pFunc,pArgs);
        pResult = PyObject_CallObject(pFunc,pArgs);
        
        result = (pResult == Py_True);
        Py_DECREF(pResult);
        std::cout<<"Bla";
    }
    Py_XDECREF(pArgs);
    
    return result;
}


extern "C" void finalize(){
    Py_DECREF(pFunc);
    Py_DECREF(pModule);
    Py_Finalize();
}
