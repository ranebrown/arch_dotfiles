#!/bin/bash

export MATLAB_JAVA=/usr/lib/jvm/java-8-openjdk/jre/
 
exec matlab -desktop "$@"

