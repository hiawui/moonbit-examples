#!/bin/bash

for modfile in `find . -name 'moon.mod.json'`
do
    modpath=`dirname $modfile`
    cd $modpath
    moon clean
    cd ..
done
