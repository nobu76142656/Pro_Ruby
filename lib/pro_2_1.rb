#
# プロを目指す人のためのRuby入門 2018年11月03日（土）
#

#
# 【文字列】
#

# Ruby コンソール irb

a = 'hello world'
puts a

# オブジェクトの内容を文字列化する
puts '1'.to_s

# 数値を16進数の文字列に変換する
puts 10.to_s(16)
puts 354846.to_s(16)

# 引数はカッコを省略できる。rubyはカッコを省略できる。
puts 10.to_s 16

# セミコロン；を使って、複数の分を一行に書ける。
puts 94494.to_s(16); puts 48644.to_s(16)

# 123や"Hello"など、ソースコードに直接埋め込めることのできる値のことをリテラルという。

# 変数名は慣習として小文字のスネークケースで書く。キャメルケースは使わない。
# 変数名はアルファベットの小文字、あるいはアンダースコア＿から始める。
# 数字から始めるのはエラー。

# 改行文字\n などの特殊文字を使う時は”　”ダブルクォートを使う。
# 式展開 #{ } でもダブルクォートを使う。シングルクォートでは式展開されない。

name = 'Alice'
puts "Hello, #{name}"
puts 'hello, #{name}'

# 式展開を使わず、+ で変数と文字列を連結することができるが、式展開の方が
# 見やすいし書きやすい。

# /n や式展開を打ち消したい場合は、バックスラッシュ\ を使う。
puts "\#{name}"

# 同様に、シングルクオートの中にダブルクォート、ダブルクォートの中に
# シングルクオートを含める時もバックスラッシュを使う。

# 文字列を比べる。
p 'ruby' == 'ruby'
p 'ruby' != 'perl'


#
#【数値】
#

# 数値は＿を挟める。
p 1_000_000_000

# nに1を足し込む
n = 1
p n += 1

# nを3倍にする
n = 2
p n *= 3

# 文字列は数値に変換して計算する必要がある。
# エラー：p 1 + '10'

# 整数に変換
p 1 + '10'.to_i 

# 少数に変換
p 1 + '10.5'.to_f 

# 文字列に数値を直接連結できない。to_sで数値を文字列にする。
number = 3
# エラー：'この数字は' + number

p 'この数字は' + number.to_s

# 式展開の場合は自動的にto_sが呼び出され文字列となる
p "この数字は#{number}"


#
# 【真偽値と条件分岐】
#

# falseとnil以外はtrue
# ''もtrue。-1、0もtrue

# nilも偽というRubyの特性をよく利用する。

data = "find_data"
if data != nil
  p 'データがあります'
else
  p 'データがありません'
end

# これを以下のように書ける
if data
  p 'データがあります'
else
  p 'データがありません'
end

# && かつ、||または
t1 = true
t2 = true
f1 = false
f2 = false

p t1 && t2 # true
p t1 && f1 # false

p t1 || f1 # true
p f1 || f2 # false

# &&の方が優先度が高い。
p t1 && t2 || f1 && f2 # true
p t1 && f2 || f1 && f2 # false

# カッコを使うと優先度を変えられる。
p t1 && (t2 || f1) && f2 # false

# !演算子で反転する。
p !t1
p !(t1 && t2)

# if 条件A
#   条件Aが真だった時の処理
# elsif 条件B
#   条件Bが真だった時の処理
# else
#   それ以外の処理
# end

# Rubyのif文は戻り値を返す。これを利用して、if文の戻り値を変数に入れる。
country = 'italy'

greeting = 
  if country == 'japan'
    'こんにちは'
  elsif country == 'us'
    'Hello'
  elsif country == 'italy'
    'ciao'
  else
    '????'
  end

p greeting

# Rubyのif文は修飾子として分の後ろに置くことができる。
point = 7
day = 1

# if day == 1
#   point *= 5
# end

p point *= 5 if day ==1


#
#【メソッドの定義】
#

# メソッド名も変数名と同じルール。小文字のスネークケースで書く。

# Rubyは最後に評価された式が戻り値になるのが特徴。戻り値の型情報は書かない。
# returnも使えるが、使わないのが主流。

def greeting(country)
  # こんにちは、またはHelloが戻り値になる。
  if country == 'japan'
  'こんにちは'
  else
    'Helo'
  end
end
p greeting('japan')

#returnは途中で脱出する場合に使われる。
def greeting(country)
  # countryがnilならメッセージを返してメソッドを抜ける
  # (nil?はオブジェクトがnilの場合にtrueを返すメソッド)
  return 'countryを入力してください' if country.nil?
  
  if country == 'japan'
    'こんにちは'
  else
    'Hello'
  end
end
p 'nilを引数とした場合 ' + greeting(nil)

# 引数空白はエラーになる。
# p greeting()

# 引数''はHelloが返される。（\バックスラッシュはシングルクオートを出力するため。
p '\'\'(シングルクオートに囲まれた空白)を入れた場合 ' + greeting('')

# Rubyはカッコを省略できる。引数のないメソッドの場合カッコは省略
# 引数がある時はカッコを入れる。


# fizz buzzメソッド

# 15は3でも割り切れるし5でも割り切れる。条件式をこの２つより下にしてしまうと、
# それらの式に先に当てはまってしまう。先に持ってくる。

def fizz_buzz(n)
  if n % 15 == 0
    p '15で割り切れる'
  elsif n % 3 == 0
    p '3で割り切れる'
  elsif n % 5 == 0
    p '5で割り切れる'
  else
    p n.to_s
  end
end

fizz_buzz(16)
fizz_buzz(15)
fizz_buzz(10)
fizz_buzz(6)
fizz_buzz(5)
fizz_buzz(3)
fizz_buzz(2)
fizz_buzz(1)

fizz_buzz(9403)



