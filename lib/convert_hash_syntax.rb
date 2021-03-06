# 正規表現を作る時は、Rubular http://rubular.com/ を使ってトライアンドエラー
# を繰り返しながら作っていくのが便利。

# シンボルをマッチさせる
# まず:。:のあとにはアルファベットや数字、アンダースコアが続く
# :[a-z0-9_]

# []は[]内のいずれかの1文字を表す。ここまでだと1文字しかマッチしない。
# + は直前の文字が1回以上連続するの意味。これを付ける。

# :[a-z0-9_]+
# [a-z0-9_]と\wは同じ意味なので、変える。
# :\w+

# シンボルから続くのは=>なので、=>をそのまま書けばマッチするが、前後の
# スペースに関する問題。
# スペースは0個以上だったらよしとする。直前の文字が0個以上 * 。
# 直前のスペースが0個以上。 スペース*となる。
# :\w+ *=> *となる。


# 要素ごとに異なる部分はキャプチャしそこは置き換えない。そこ以外を置き換える。
# ()で文字列の部分をキャプチャ。
# :(\w+) *=> *

# 以上を元に実装する。

def convert_hash_syntax(old_syntax)
  old_syntax.gsub(/:(\w+) *=> */, '\1: ')
end

# \1は1番目にキャプチャされた文字列を表す。つまり、name、age、gender。
# これらはそのまま残しあとの部分は全て:に置き換えている。(消している)

