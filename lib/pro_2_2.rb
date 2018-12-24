#
# 文字列についてもっと詳しく
#


# classメソッドでそのオブジェクトのクラスを確認できる。
p 'abc'.class


# %q! !はシングルクオートで囲んだことと同じになる。
puts %q!He said, "Don't speak."!


# %Q! !はダブルクォートで囲んだのと同じになる。改行文字や式展開が使える。
something = 'Hello'
puts %Q!He said, #{something}!


# %! !でも同じ。
puts %!#{something}　と彼は言った!


# ! !の区切り文字は?や＾など任意の記号で良い。
puts %$#{something}と彼女は言った$

# カッコを使う場合は終わりが対応するカッコ。
puts %[#{something}とカッコは言った]

# 複数行の出力にしたい場合はヒアドキュメントを使う。TEXTは任意でよい。p43
a = <<TEXT
これはヒアドキュメント
複数行出力
に便利
TEXT

# <<-TEXT -は最後の識別しをインデントすることができる。
# メソッド内で使う時などに有効。

# <<~TEXT ~を入れると、ヒアドキュメント内インデントの空白が無視される。
# ヒアドキュメント内では式展開が有効。

puts a

# 数値を文字列に変換。
p 123.to_s

# 配列を連結して1つの文字列にする。
p [10, 20, 30].join

# *演算子を使って繰り返す。
p 'Hi!' * 10


#
# 真偽値と条件分岐についてもっと詳しく
#

# &&、|| に近い働きのand、or、notがある。ただし優先順位が低い。
t1 = true
t2 = true
f1 = false
f2 = false

p t1 and t2 # true
p 'falseになる' "#{t1 and f1}"

p f1 or f2 # false
p t1 or f1 # true

p 'なぜか逆になる。文字列を付けると正しくなる' "#{not t1}" # false

# andやorは条件分岐に使わず、制御フローに使うのが向いている。

# unless文は条件式が偽になった時だけ処理を実行。
status = 'error'
if status != 'ok'
  p '何か異常があります'
end

# unlessを使って書き換える
unless status  == 'ok'
  p '何か異常があります'
else
  p '正常です'
end

# 一行にできる。
p '何か異常があります' unless status == 'ok'

# unlessにはelsifに相当するものはない。


# 三項演算子（条件演算子）※複雑な条件文には使わない。

# 式？真だった場合の処理：偽だった場合の処理
n = 11
if n > 10
  p '10より大きい'
else
  p '10以下'
end

# これを書き換える。
p n > 10 ? '10より大きい' : '10以下'


#
# メソッド定義についてもっと詳しく
#

# Rubyでは引数の過不足があるとエラーになる。
# デフォルト値を設定すれば、引数がなくてもエラーにならない。
def greeting(country = 'japan')
  if country == 'japan'
    'こんにちは'
  else
    'hello'
  end
end

p greeting
p greeting 'us'

# デフォルト値ありとなしの引数を混在させることも可能。
# 動的に変わる値や、他のメソッドの戻り値も引数にできる。
def foo(time = Time.now, message = bar)
  puts "time: #{time}, message: #{message}"
end

def bar
  'BAR'
end
foo

# ?で終わるメソッド
# Rubyのメソッド名は？や！で終わらせることができる。
# ？で終わるメソッドは慣習として真偽値を返すメソッド。

# 空文字列であればtrue、そうでなければfalse
p ''.empty?

# 引数の文字悦が列まれていればtrue、そうでなければfalse
p 'watch'.include?('at')

# 奇数ならtrue、偶数ならfalse
p 1.odd?

# 偶数ならtrue、奇数ならfalse
p 1.even?

# オブジェクトがnilであればtrue、そうでなければfalse
p nil.nil?
p 'abc'.nil?

# ?で終わらせるメソッドは自作もできる。真偽値を返すメソッドは?で終わらせる。


# !で終わるメソッド
# 使用に注意が必要という意味。呼び出したオブジェクトの状態を変更するメソッドを
# 破壊的メソッドという。
a = 'ruby'

# 呼び出したオブジェクトを変えない。
p a.upcase
p a

# 呼び出したオブジェクトを変える。
p a.upcase!
p a

# 破壊的メソッドすべてに！がついているわけではない。エラーを発生させるメソッド
# など、なんらかの注意が必要な場合に付ける場合もある。APIドキュメントで確認する。

# Rubyの参照にはオブジェクトそのものではなく、オブジェクトへの参照が格納されている。
# 変数がどのオブジェクトを参照しているのかは、object_idメソッドでわかる。

#
# 参照の概念 p61
#

# aとbは同じ文字列だが、オブジェクトとは別物。
p a = 'hello'
p b = 'hello'

p a.object_id
p b.object_id

# cとbは同じオブジェクト
c = b
p c.object_id

# equal?メソッドで同じオブジェクトか確認できる。
p a.equal?(b)
p c.equal?(b)

# 渡された文字列を破壊的に大文字に変換するメソッド
def m!(d)
  d.upcase!
end
p m!(c)

# bとcは同じオブジェクトを参照しているのでcを破壊的メソッドで変更すると、bも変わる。
p "bは#{b}"
p "cは#{c}"

#
# require
#

# 組み込みクラスではない標準ライブラリやgemを利用する場合は、require ライブラリ名。

# 自分で作成したRubyプログラムをを読み込む場合も requireを使う。（クラスなど）
# 相対パス、絶対パスで指定。

# 同じディレクトリの場合は以下のように読み込む。
# require './sample.rb'

# 拡張子はなくてもよい。
# require './sample'

# requireは一回しか読み込まれない。毎回無条件に指定したファイルを読み込ませたい場合は
# loadを使う。この場合、拡張子は省略できない。

# load './sample.rb'

# requireはRubyを実行しているディレクトリがパスの起点になるが、
# require_relativeを使えば、自分のファイルがパスの起点になる。

# フォルダは違うが、同じ階層（隣）のフォルダ内を指定する場合。hello.rbが起点。
# require_relative '../bar/bye.rb'

