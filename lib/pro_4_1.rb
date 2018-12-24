#
# 配列
#


# 存在しない要素を指定してもエラーにならず、nilが返る。


# 元の大きさよりも大きい添え字を指定すると間の値がnilで埋められる。
a = [1, 2, 3]
a[4] = 50
p a


# <<で配列の最後の要素を追加
p a << 2
p a << 3


# 配列内の特定の位置にある要素を削除する場合はdelete_atメソッド。
# 削除した値が戻り値になる。
a = [1, 2, 3,]
p a.delete_at(1)
p a


# 右辺に配列を置いた場合でも多重代入できる。
c, d = 25, 35
a, b = [98,883]

p a,b
p c,d


# 右辺の数が少ない場合はnilが入る。
c,d = [28]
p c,d


# 右辺の数が多い場合ははみ出した値は切り捨て
e, f = [100, 200, 300]
p e
p f


# divmodメソッドは商と余りを配列として返す。こういった場合、多重代入を使って
# 最初から別々の変数に入れた方がスッキリしたコードになる。
p 14.divmod(3)


# 戻り値を配列のまま受け取る。
quo_rem = 14.divmod(3)
p "商=#{quo_rem[0]}","余り=#{quo_rem[1]}"


# 多重代入で別々の変数として受け取る。
quotient, remainder = 285.divmod(21)
p "商=#{quotient}","余り=#{remainder}"




#
# ブロック
#


number = [1,2,3,4]
# sumに0を入れておかないと、nilに数字を足すことになりエラーになる。
sum = 0
number.each do |n|
  sum += n
end
p sum


# 配列には指定した値に一致する要素を削除するdeleteメソッドがある。
a = [1,2,3,1,2,3]
a.delete(2)
p a


# 条件を指定して削除するdelete_ifメソッド
a = [1,2,3,1,2,3]
a.delete_if do |n|
  # 奇数の場合にtrue
  n.odd?
end
p a


# 三項演算子（条件演算子）
# 式？真だった場合の処理：偽だった場合の処理


# この場合のsum_valueはブロック引数。ブロック外で同じ名前があった時
# ブロック内ではブロック引数の値が優先して使われる。
numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end
p sum



#
# ブロックを使う配列のメソッド
#


# mapメソッド(エイリアスメソッドはcollect)
numbers = [1,2,3,4,5]
new_numbers = []
number.each { |n| new_numbers << n*10 }

numbers = [1,2,3,4,5]
# ブロックの戻り値が新しい配列の各要素になる。
new_numbers = number.map { |n| n*10 }
p new_numbers


# selectメソッド(エイリアスメソッドはfind_all)
numbers = [1,2,3,4,5,6]
# ブロックの戻り値が真になった要素だけ集められる。
even_numbers = numbers.select { |n| n.even? }
p even_numbers


# rejectメソッド（selectの反対)
numbers = [1,2,3,4,5,6]
# ブロックの戻り値が偽になった要素だけ集められる。
even_numbers = numbers.reject { |n| n.even? }
p even_numbers


# findメソッド（エイリアスメソッドはdetect)
numbers = [1,2,3,4,5,6]
# ブロックの戻り値が最初に真になった要素を返す。
even_numbers = numbers.find { |n| n.even? }
p even_numbers


# inject/reduce たたみ込み演算を行うメソッド
numbers = [1,2,3,4]
sum = 0
numbers.each { |n| sum += n }
p sum


# 上記をinjectで書く。resultの部分に次々処理結果が入る。nはeach文と同じ動き。
numbers = [1,2,3,4]
sum = numbers.inject(0) { |result, n| result + n }
p sum

# injectは文字列でも可能



#
# 範囲オブジェクト
#


# 最初の値..最後の値：最後の値を含む（以下）
# 最初の値...最後の値：最後の値を含まない（未満）
# 少数も含まれる。to_aメソッドは配列に変換する。
a = (1..5).to_a
p a
a = (1...5).to_a
p a


# 文字列に対しても範囲演算子は使える。
a = ('a'..'g').to_a
p a


# 添え字の代わりに範囲オブジェクトを渡すと、指定した範囲の要素を取得。
a = [1,2,3,4,5]
b = a[1..3]
p b

a = 'abcdefghi'
b = a[4..6]
p b


# n以上m以下、n以上m未満の判定。<や>=を使うよりも範囲オブジェクトを使った方が早い。
# 不等号を使う場合
def liquid?(temprature)
  # 0度以上１００度未満だったら液体と判定したい
  0 <= temprature && temprature < 100
end
p liquid?(-1)


# 範囲オブジェクトを使う場合
def liquid?(temprature)
  (0...100).include?(temprature)
end
p liquid?(-1)
p liquid?(50)
p liquid?(100)


# case文との組み合わせ
def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end


# 繰り返し処理を行う
numbers = (1..4).to_a
sum = 0
numbers.each { |n| sum += n }
p sum


# 配列に変換しなくてもeachメソッドが使用可能
sum = 0
(1..30).each { |n| sum += n }
p sum


# stepメソッドで値を増やす感覚を指定できる
# 1から１０までを２つ飛ばしで繰り返す。
numbers = []
(1..10).step(2) { |n| numbers << n }
p numbers



#
# RBG変換プログラムを作成する
#

# rgb.rb
# rgb_test.rb



#
# 配列についてもっと詳しく
#

# 添字を２つ使うと、添え字の位置と取得する長さを指定できる。
# 配列[位置、 取得する長さ]

a = [1, 2, 3, 4, 5, 6, 7]
p a[2, 3]


# values_atメソッドで取得したい要素の添え字を複数指定できる。
p a.values_at(0,4,6)


# 配列の長さ -1 を指定すれば最後の要素を取得できる。
p a[a.size - 1]


# Rubyでは添え字に負の値が使える。
# -1は最後の要素。-2は最後から2番目の要素。
p a[-1]
p a[-4]


# 最後から２番目の要素から指定個の要素を取得
p a[-5, 3]


# firstとlast
p a.first(2)
p a.last(4)


#
# 様々な要素の変更方法
#

# <<だけでなくpushメソッドでも要素を追加できる。

a = []
p a.push(1)
p a.push(2,5,933)


# 指定した値に一致する要素を削除したい場合はdeleteメソッドを使う。
# 値が２である要素を削除する。
a = [1,2,3,2,4,5,2,2,5,3,2]
a.delete(2)
p a


# 配列を連結する時はconcatメソッドか+演算子を使う。
# 違いは元の配列を変更するか（破壊するか）の違い。
a = [1,2]
b = [3,4,5]
p a.concat(b)
p a # aは破壊される
p b # bは破壊されない


# +は元の配列を変更せず、新しい配列を作成。
a = [6,5]
b = [4,3,2]
p a + b
p a
p b

# 破壊的な変更は思いがけないところで悪影響を与えることがる。
# どうしても、という時以外は＋を使う。


# 配列の和集合：２つの配列を集め重複しないように返す。
# 同じ配列の中の重なった要素も1つになる。
a = [1,2,3,6,3,6,0,657,24,66,24]
b = [2,3,4,5,23,6556,34,66,4,]
p a | b

# 差集合：左の配列から右の配列に含まれる要素を取り除く。
a = [1,2,3,5,8,96,2,333]
b = [2,3,4,4,3,73,4,443]
p a - b

# 積集合：２つの配列に共通する要素を返す。
a = [4,7,44,90,45,23,1,97]
b = [2,7,665,9560,6,6,1,97]
p a & b

# 和集合、差集合、積集合はいずれも非破壊的。

# Rubyには配列よりも効率的に集合を扱えるSetクラスがある。
# 本格的な集合演算をする場合はSetクラスを使う。
require 'set'
a = Set.new([1,2,3])
b = Set.new([3,4,5])
p a | b
p a - b
p a & b


# 多重代入ではみ出て切り捨てられる要素を配列として受け取る。
e, f = 100, 200, 300
p e,f
e,*f = 100, 200, 300
p e,f


# pushのsplat展開

a = []
b = [2, 3]
a.push(1)
p a.push(b) # これでは配列の入れ子になってしまう。
p a.push(*b) # これで配列ではなく複数の引数として渡せる。


# メソッドの可変長引数。pushメソッドのように工数に制限のない。
# 自分で可変長引数を作る場合。
# def メソッド名(引数１、*可変長引数)
# end
# joinは引数の文字を入れ込んで配列を1つの文字列にする。
def greeting(*names)
  "#{names.join('と')}, こんにちは！"
end
p greeting('田中さん')
p greeting('斉藤さん', '遠藤さん')


# *で配列同士を非破壊的に連結する。
a = [1,2,3]
p [a] # 配列の中に配列が入ってしまう。
p [*a] # 配列が展開されて別々の要素になる。


# これを利用して別の配列を要素の一部とできる。
a = [1,2,3]
p [-1,0,*a,4,5]


# == で等しい配列か判断する。


# 【% 記法】
# 文字列については %w で配列を作成できる。
# カンマではなく空白（スペースや改行）が要素の区切り文字となる。
# 文字列をシングルクォートやダブルクォートで区切る必要もない。

# []で文字列の配列を作成
['apple', 'melon', 'orange']


# %w で作成(!で囲む場合)
p %w!apple melon orenge!


# %w で作成(丸カッコで囲む場合)
p %w(apple melon orange)


# 配列から偶数番目だけ抜き出す。（本は関係ない）
# ary.select.with_index{|e, i| i % 2 == 1}
# ary.each_slice(2).collect{|e| e[1]}
# http://suke.cocolog-nifty.com/blog/2015/04/javaruby-b322.html


# スペースや改行が連続した場合も一つの区切り文字とみなされる。
p %w(
  article 記事
  comparison 比較
  confirmation 確認
  fatal 致命的な
  )

# 値にスペースを含めたい場合は\(バックスラッシュ）でエスケープする。
p %w(big\ apple small\ melon orange)


# 式展開や改行文字(\n)、タブ文字(\t)を含めたい場合は %W (大文字)を使う。
prefix = 'This is'
p %W(#{prefix}\ an\ apple small)


# 文字列を配列に分解する。
p 'Ruby'.chars

# splitメソッドは引数で渡した区切り文字で文字列を配列に分解する。
p 'Ruby,Java,Perl,PHP'.split(',')


# 配列に初期値を設定する。
# a = []と同じ
# a.Array.new

# a = Array.new(5)
#=> [nil,nil,nil,nil,nil]


# 第2引数に初期値を渡す。
# a = Array.new(5, 0)
#=> [0,0,0,0,0]


# ブロックを使って初期値を設定できる。ブロックの引数には要素の添え字が渡される。
ar = Array.new(10) { |n| n + 1 }
p ar


# 第2引数に初期値を渡すときの注意点。第2引数として渡すと、参照が全て同じになり、
# 1つを変更すると、全てが変更されてしまう。これを避けるためにブロックで設定。
a = Array.new(5){ 'defoult' }


#
# ブロックについてもっと詳しく
#

# 添え字付きの繰り返し処理：each_with_index
fruits = ['apple', 'orange', 'melon']
# ブロック引数のi には要素の添え字が入る。
p fruits.each_with_index { |fruits, i| puts "#{i}: #{fruits}" }


# mapメソッド
numbers = [1,2,3,4,5]
# ブロックの戻り値が新しい配列の各要素になる。
new_numbers = number.map { |n| n*10 }
p new_numbers


# mapメソッドで添え字を付ける：with_indexメソッド
fruits = ['apple', 'orange', 'melon']
p fruits.map.with_index { |fruits, i| "#{i}: #{fruits}" }


# 添え字を0以外から開始させる。.with_index(1)とする。
fruits = ['apple', 'orange', 'melon']
p fruits.map.with_index(1) { |fruits, i| "#{i}: #{fruits}" }


# ★ブロック引数を2つにする。
dimensions = [
  # [縦,横]
  [10,20],
  [30,40],
  [50,60]
]
# 面積の計算結果を収納する配列
areas = []
# ブロック引数が1つであれば、配列として入る。
dimensions.each do |dimension|
  length = dimension[0]
  width = dimension[1]
  areas << length * width
end
p areas

# ブロック引数を2つにするともっとシンプルに書ける。
# 配列内の要素それぞれが2つの引数に入る。
dimensions.each do |length, width|
  areas << length * width
end


# each_with_indexのようにもとからブロック引数が2つある場合。
dimensions = [
  # [縦,横]
  [10,20],
  [30,40],
  [50,60]
]

# 以下だとうまくいかない。
p dimensions.each_with_index do |length, width, i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end

# ブロック引数をカッコで囲む。
dimensions.each_with_index do |(length, width), i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end

# 繰り返し処理以外でも使用されるブロック
File.open("./sample.txt", "w") do |file|
  file.puts("１行目のテキストです。")
  file.puts("２行目のテキストです。")
  file.puts("３行目のテキストです。")
end


# do..endと{}の結合度の違いにより、{}の場合のメソッドの引数の
# カッコの省略はできない。


#
# 様々な繰り返し処理
#

# timesメソッド
sum = 0
5.times { |n| sum += n }
p sum


# ブロック引数は省略できる。
sum = 0
p 5.times { sum += 1 }


# nからmまで数値は1づつ増やしながら何か処理をしたい場合は、Integerクラスの
# upto メソッドを使う。
a = []
10.upto(14) { |n| a << n }
p a

# 逆に減らす場合。
a = []
14.downto(10) { |n| a << n }
p a


# nからmまで数値をx個ずつ増やしなが処理をする場合は、
# Numericクラスのstep メソッドを使う。
# 開始値.step(上限値, 1度に増減する大きさ)
a = []
2.step(20, 2) { |n| a << n }
p a

# while文とuntil文 p134〜p144未読




