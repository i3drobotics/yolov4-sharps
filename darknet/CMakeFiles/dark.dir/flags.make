# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# compile C with /usr/bin/cc
# compile CUDA with /usr/local/cuda-11.0/bin/nvcc
# compile CXX with /usr/bin/c++
C_DEFINES = -DCUDNN -DGPU -DLIB_EXPORTS=1 -DOPENCV -DUSE_CMAKE_LIBS -Ddark_EXPORTS

C_INCLUDES = -I/home/i3dr/Desktop/YOLOv4/darknet/include -I/home/i3dr/Desktop/YOLOv4/darknet/src -I/home/i3dr/Desktop/YOLOv4/darknet/3rdparty/stb/include -I/usr/local/cuda-11.0/targets/x86_64-linux/include -isystem /usr/local/include/opencv4

C_FLAGS = -Wall -Wno-unused-result -Wno-unknown-pragmas -Wfatal-errors -Wno-deprecated-declarations -Wno-write-strings  -Ofast -DNDEBUG -ffp-contract=fast -mavx -mavx2 -msse3 -msse4.1 -msse4.2 -msse4a -fPIC -fopenmp

CUDA_DEFINES = -DCUDNN -DGPU -DLIB_EXPORTS=1 -DOPENCV -DUSE_CMAKE_LIBS -Ddark_EXPORTS

CUDA_INCLUDES = -I/home/i3dr/Desktop/YOLOv4/darknet/include -I/home/i3dr/Desktop/YOLOv4/darknet/src -I/home/i3dr/Desktop/YOLOv4/darknet/3rdparty/stb/include -I/usr/local/cuda-11.0/targets/x86_64-linux/include -isystem=/usr/local/include/opencv4

CUDA_FLAGS = -gencode arch=compute_61,code=sm_61 --compiler-options " -Wall -Wno-unused-result -Wno-unknown-pragmas -Wfatal-errors -Wno-deprecated-declarations -Wno-write-strings -DGPU -DCUDNN -DOPENCV -fPIC -fopenmp -Ofast "  -O3 -DNDEBUG -Xcompiler=-fPIC -std=c++11

CXX_DEFINES = -DCUDNN -DGPU -DLIB_EXPORTS=1 -DOPENCV -DUSE_CMAKE_LIBS -Ddark_EXPORTS

CXX_INCLUDES = -I/home/i3dr/Desktop/YOLOv4/darknet/include -I/home/i3dr/Desktop/YOLOv4/darknet/src -I/home/i3dr/Desktop/YOLOv4/darknet/3rdparty/stb/include -I/usr/local/cuda-11.0/targets/x86_64-linux/include -isystem /usr/local/include/opencv4

CXX_FLAGS = -Wall -Wno-unused-result -Wno-unknown-pragmas -Wfatal-errors -Wno-deprecated-declarations -Wno-write-strings  -Ofast -DNDEBUG -ffp-contract=fast -mavx -mavx2 -msse3 -msse4.1 -msse4.2 -msse4a -fPIC -fvisibility=hidden -fopenmp -std=gnu++11
