#!/bin/bash

# from https://www.topbug.net/blog/2012/03/17/generate-ctags-files-for-c-slash-c-plus-plus-source-files-and-all-of-their-included-header-files/
# ./ctags_with_dep.sh file1.c file2.c ... to generate a tags file for these files.

gcc -M -Iinc/ $* | sed -e 's/[\\ ]/\n/g' | \
	sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | \
	ctags -L --append=yes --c-kinds=+p --fields=+liaS --extra=+q
