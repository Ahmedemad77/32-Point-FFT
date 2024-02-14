worklib:
	vlib work

#Compilation Stage Compile your Project File 
compile:  FFT_Test.sv
	vlog FFT_Test.sv -dpiheader dpi_types.h

optimize:
	vopt +acc FFT_Test -o opt_test

foreign_windows:  foreign.c
	# Here if you are exporting sv functions to be called by C or C++ you need this flag "-dpiexportobj exports" 
	# This will generate exports object that will be linked in the C++ File
	vsim -c opt_test  -dpiexportobj exports
	
	# -IC:/questasim64_2021.1/include     -> -I flag to specify a directory to get the svdpi.h header File
	# "-LC:/Program Files/Python312/libs" -> -L flag to specify a directory to get the Python library  
	# -shared -g -o foreign.dll           -> generate dynamic link shared libray  
	# -lpython312 			      -> -l flag links the python312 library 
	# pythonexports.obj 		      -> Specifies an object file to include in the Compilation
	# -lmtipli 			      -> Links the "mtipli" library 
	# map this directories for your system
	g++ -IC:/questasim64_2021.1/include "-LC:/Program Files/Python312/libs" -shared -g -o foreign.dll FFT_Verifer.cpp -lpython312 exports.obj -lmtipli -LC:/questasim64_2021.1/win64

sim:
	vsim opt_test -sv_lib foreign

all_windows: worklib compile optimize foreign_windows sim


