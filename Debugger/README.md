# 使用したコンパイラ
```
ifort (IFORT) 14.0.0 20130728
Copyright (C) 1985-2013 Intel Corporation.  All rights reserved.
```

# 流れ
1. `-pg` を付けてコンパイル
2. プログラムを実行
3. `gmon.out` が生成されるはず
4. `gprof [実行ファイル名] gmon.out` を実行し、レポートを作成する
