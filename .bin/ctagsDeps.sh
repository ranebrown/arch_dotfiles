#!/bin/bash

# extracts header files used for a file and generates the ctags for them
# $* is used to accept command line arguments i.e. include paths and the file to generate tags for
# final pipe to awk removes the first line which is a reference to the object file
# use: ctagsDeps -Ipath/to/header ... file1 file2 ...
# ctags -L flag reads a list of files if - is used for filename then files are read from stdin
gcc -M $* | awk '{print $1}' | awk '{if(NR>1)print}' | ctags --append=yes --c-kinds=+p --fields=+liaS --extra=+q -f.tags -L -
