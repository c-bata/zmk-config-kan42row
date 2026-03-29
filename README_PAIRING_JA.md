# kan42 接続ガイド

このキーボードは ZMK firmware を使っており、Bluetooth 接続と USB 接続を切り替えて使えます。

キー割り当ては [config/boards/shields/kan42/kan42.keymap](/home/cbata/go/src/github.com/c-bata/zmk-config-kan42row/config/boards/shields/kan42/kan42.keymap) にあり、接続関連の操作は `fn_layer` に割り当てています。

## 接続関連キー

`fn_layer` は、右端親指キーの `&mo 2` を押している間だけ有効になります。

- `BT_SEL 0`: Bluetooth プロファイル 0 を選ぶ
- `BT_SEL 1`: Bluetooth プロファイル 1 を選ぶ
- `OUT_TOG`: 出力先を USB と Bluetooth で切り替える
- `BT_CLR`: 現在選択中の Bluetooth プロファイルのペアリング情報を削除する

現在の keymap では `fn_layer` の 2 段目に次の順で割り当てています。

- `A` の位置: `BT_SEL 0`
- `S` の位置: `BT_SEL 1`
- `D` の位置: `OUT_TOG`
- `F` の位置: `BT_CLR`

## 1台目を Bluetooth 接続する

1. 右端親指の `&mo 2` を押して `fn_layer` に入ります。
2. `A` の位置の `BT_SEL 0` を押します。
3. 接続したい PC / タブレット / スマートフォンで Bluetooth 機器の検索を開きます。
4. キーボードが見えたら選択してペアリングします。

## 2台目を Bluetooth 接続する

1. 右端親指の `&mo 2` を押して `fn_layer` に入ります。
2. `S` の位置の `BT_SEL 1` を押します。
3. 接続したい端末側で Bluetooth 機器の検索を開きます。
4. キーボードが見えたら選択してペアリングします。

`BT_SEL 0` と `BT_SEL 1` は別々の接続先を保持できます。1台目に戻したいときは `BT_SEL 0`、2台目に切り替えたいときは `BT_SEL 1` を押します。

## USB 接続と Bluetooth 接続を切り替える

1. 右端親指の `&mo 2` を押して `fn_layer` に入ります。
2. `D` の位置の `OUT_TOG` を押します。

これで出力先が USB と Bluetooth の間で切り替わります。

Bluetooth 接続したいのに端末から見つからない場合は、`OUT_TOG` を押して Bluetooth 側に切り替えてからもう一度 `BT_SEL 0` または `BT_SEL 1` を試してください。

## ペアリングをやり直す

ある接続先のペアリング情報を消したい場合は、そのプロファイルを選んでから `BT_CLR` を押します。

例:

1. `BT_SEL 1` を押してプロファイル 1 を選ぶ
2. `BT_CLR` を押してプロファイル 1 のペアリング情報を削除する
3. もう一度 `BT_SEL 1` を押して、新しい端末でペアリングする

