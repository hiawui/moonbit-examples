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
if [ ! -f $mod/moon.mod.json ]; then
    echo not a moon module
    exit 0
fi
cd $mod
echo cleaning...
moon clean
echo checking...
moon check
echo formatting...
moon fmt
echo building...
moon build --target wasm-gc
echo wasm-opt...
wasm-opt target/wasm-gc/release/build/main/main.wasm -O3 -o target/main-opt.wasm --enable-bulk-memory --enable-gc --enable-reference-types
