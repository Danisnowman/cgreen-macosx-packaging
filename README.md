# Packaging Cgreen for MacOSX

Cgreen is a framework for unittests and mocking in C and C++. You can
visit [GitHub](http://github.org/cgreen-devs/cgreen) for more info.

Cgreen is mostly C99-compatible and can be compiled on most platforms
that support messaging.

Packaging to a MacOSX package can easily be done with the Makefile in
this little project.

The variable VERSION in the Makefile can be changed to define which
version/release that will be automatically downloaded from
[GitHub](http://github.org/cgreen-devs/cgreen) and built. It should be
the exact name of the release tag. It also controls the name of the
resulting package.

Then just do

    make

NOTE: You need [CMake](cmake.org) to compile Cgreen.