#!/bin/bash

mod=$1
if [ -z "$mod" ]; then
    echo $0 [module]
    exit 0
fi
if [ ! -d "$mod" ]; then
    echo module $mod not exists
    exit 0
fi
if [ ! -f $mod/moon.mod ]; then
    echo not a moon module
    exit 0
fi
cd $mod
echo formatting...
moon fmt
echo building...
moon build
echo wat2wasm...
wat2wasm target/build/main/main.wat -o target/main.wasm