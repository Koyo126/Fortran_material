# 概要
Fortran の open 文について。

# usage
代表的な option について以下にまとめる。

`open(UNIT,FILE[,STATUS][,ACTION][,POSITION][,IOSTAT])`

* UNIT -> 装置番号

* FILE -> ファイルのパス（絶対パスでも相対パスでも可）

* STATUS --- ファイルの状態
  * "NEW" --- 新規作成。ファイルが既に存在するとエラーを吐く

  * "OLD" --- 既に存在するファイルを開く。ファイルが存在しないとエラーを吐く

  * "REPLACE" --- 新規作成。ファイルが無ければ新規に作成し、あれば削除して作成

  * "UNKNOWN"（default） --- 処理系依存。

* ACTION --- ファイルに対する動作の指定
  * "READ" --- 読み込み専用

  * "WRITE" --- 書き込み専用

  * "READWRITE"（default） --- 読み込みも書き込みも可

* POSITION --- 書き込み・読み込みの開始位置
  * "APPEND" --- WRITE 時に、最後尾に追記する
  
  * "REWIND"（default） --- READ 時に 1 行目から読み込む / WRITE 時に内容を消去して新しく書き込む

* IOSTAT --- エラー検出用。以下の値を返す。
  * 0 --- 正常

  * -1 --- EOF (End of File)

  * 正数 --- エラー

* FMT --- フォーマット
  * "FORMATTED"（default） --- アスキー形式（書式付き）。

  * "UNFORMATTED" --- バイナリ形式（書式なし）

* ADVANCE --- 改行の有("yes")無("no")。default は "yes"。
