# Docker based development environments

This project contains docker based development environments
It is complementary from
- `lrte` where I try to build bazel toolchains and runtimes containing `gcc`, `clang` and `ispc` cross compilers.
- bazel rules for ispc, fortran etc (TODO)

## interested in:
* gcc toolchains already exist on dockerhub
    - `gcc:7.2` 
    - `gcc:4.9.3`
    - `gcc:5.4.0`
    - `gcc:6.3.0`
* llvm ones do not, but there are docker files in the llvm svn trunk
    - `clang:4.0`
    - `clang:5.0`
    * clang with polly.
    * openmp support 
    * ispc 
* cuda 
* intel c++ (with external license)
    * with MKL and other optimized libraries

* scientific computing docker files
    * MKL
    * openblas, blis, fftw3, etc...
