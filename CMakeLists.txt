cmake_minimum_required(VERSION 3.15)
project(sumScalar C)

find_package(Matlab REQUIRED COMPONENTS MAIN_PROGRAM MEX_COMPILER)

matlab_add_mex(NAME sumScalar
    SRC sumScalar.c)

if(APPLE)
    # This adds $matlabdir/extern/bin/maci64 (intel arch) and $matlabdir/extern/bin/maca64 (arm arch) to @rpath
    # Note that @executable_path is the location of the executable, i.e. matlab, which is typically in $matlabdir/bin or $matlabdir/bin/<arch>
    # This is also to solve bug in MATLAB R2023b, see 
    # https://it.mathworks.com/matlabcentral/answers/2044762-why-do-i-receive-a-library-not-loaded-rpath-libmatlabengine-dylib-error-when-running-a-mex-funct  
	set(MEX_RPATH "@executable_path/../extern/bin/maci64;@executable_path/../extern/bin/maca64;@executable_path/../../extern/bin/maci64;@executable_path/../../extern/bin/maca64"
                CACHE STRING "rpath to be added into Matlab mac-os Mex")
	set_target_properties(sumScalar PROPERTIES 
                BUILD_RPATH "${CMAKE_BUILD_RPATH};${MEX_RPATH}"
                INSTALL_RPATH "${CMAKE_INSTALL_RPATH};${MEX_RPATH}"
        )
endif()

install(TARGETS sumScalar DESTINATION bin)
install(FILES testSumScalar.m DESTINATION bin)