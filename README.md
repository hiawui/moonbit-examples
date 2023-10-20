## 简介

一些基于 moonbit 的实验程序

## 目录结构

- check.sh
  - 执行 moon fmt & moon check
- build.sh

  - 构建脚本, 帮助生成各模块需要的 wasm 文件

  ```bash
  # 为指定的模块在 target 目录生成 main.wasm
  ./build.sh [module]
  ```

- simple/
  - 一些简单的实验
- throw-ball/
  - 一个抛球小游戏
