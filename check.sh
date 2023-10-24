#!/bin/bash

for modfile in `find . -name 'moon.mod.json'`
do
    modpath=`dirname $modfile`
    moon fmt --source-dir $modpath
    moon check --source-dir $modpath
done
