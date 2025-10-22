cmake_minimum_required(VERSION 3.15)
project(sumScalar C)

find_package(Matlab REQUIRED COMPONENTS MAIN_PROGRAM MEX_COMPILER)

matlab_add_mex(NAME sumScalar
    SRC sumScalar.c)

if(APPLE)
    # https://it.mathworks.com/matlabcentral/answers/2044762-why-do-i-receive-a-library-not-loaded-rpath-libmatlabengine-dylib-error-when-running-a-mex-funct  
	set_target_properties(sumScalar PROPERTIES 
        BUILD_RPATH "${CMAKE_BUILD_RPATH};@executable_path/../extern/bin/maci64;@executable_path/../extern/bin/maca64"
        INSTALL_RPATH "${CMAKE_INSTALL_RPATH};@executable_path/../extern/bin/maci64;@executable_path/../extern/bin/maca64"
    )
endif()

install(TARGETS sumScalar DESTINATION bin)
install(FILES testSumScalar.m DESTINATION bin)