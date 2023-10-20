#!/bin/bash

for modfile in `find . -name 'moon.mod'`
do
    moon check --source-dir `dirname $modfile`
done