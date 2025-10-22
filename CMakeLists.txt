cmake_minimum_required(VERSION 3.15)
project(sumScalar C)

find_package(Matlab REQUIRED COMPONENTS MAIN_PROGRAM MEX_COMPILER)

matlab_add_mex(NAME sumScalar
    SRC sumScalar.c)

install(TARGETS sumScalar DESTINATION bin)
install(FILES testSumScalar.m DESTINATION bin)