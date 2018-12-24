#
# ハッシュとシンボル
#

# ハッシュとはキーと値の組み合わせでデータを管理するオブジェクトのこと。

# 空のハッシュを作る。
{}


currencies = { 'japan'=>'yen', 'us'=>'dollar', 'india'=>'rupee' }
p currencies

# 新しいキーと値を追加する。キーが存在した場合は上書きされる。
currencies['italy'] = 'euro'
p currencies


# ハッシュから値を取り出す。存在しないキーを指定した場合はnilが返る。
p currencies['japan']
p currencies['brazil']


# eachメソッド
currencies.each do |key, value|
  puts "#{key} : #{value}"
end


# ブロック引数を1つにするとキーと値が配列に格納される。
currencies.each do |key_value|
  puts "#{key_value}"
end


# ==でハッシュ同士を比較すると同じハッシュかどうかチェックできる。
a = { 'x'=>1, 'y'=>2, 'z'=>3 }
b = { 'x'=>1, 'y'=>2, 'z'=>3 }

# 全てのキーと値が同じであればtrue。並び順が違っていてもtrue。
p a == b 


# size/lengthメソッドを使うとハッシュの要素の個数を調べられる。
p a.size


# deleteメソッドで指定したキーに対応する要素を削除できる。
# 削除しようとしたキーが見つからない時はnilが返る。
currencies.delete('us')
p currencies


# ブロックを渡すとキーが見つからない時の戻り値を作成できる。
currencies = { 'japan'=>'yen', 'us'=>'dollar', 'india'=>'rupee' }
p currencies.delete('italy') { |key| "Not found: #{key}" }



#
# シンボル
#

# シンボルは：(コロン）に続けて任意の名前を定義する（シンボルリテラル）。

# シンボルはSymbolクラスのオブジェクト。文字列はStringクラス。
p :apple.class


# シンボルはRubyの内部的には整数。なので、高速に処理できる。

# シンボルは、同じシンボルであれば全く同じオブジェクト。
# 文字列は、同じ文字列でも別のオブジェクト。
# 大量の同じ文字列と、大量の同じシンボルではシンボルの方がメモリの使用効率が良い。
p :apple.object_id
p :apple.object_id
p :apple.object_id

p 'apple'.object_id
p 'apple'.object_id
p 'apple'.object_id


# シンボルはイミュータブルなオブジェクト（非破壊的）


# シンボルの代表的な使用例がハッシュキー。
# ハッシュのキーにシンボルを使うと、文字列よりも高速に値を取り出せる。
currencies = { 'japan'=>'yen', 'us'=>'dollar', 'india'=>'rupee' }
currencies['japan'] #=> "yen"


# シンボルをキーにする。文字列より高速。
currencies = { :japan=>'yen', :us=>'dollar', :india=>'rupee' }
currencies[:japan] #=> "yen"


# オブジェクトが持っているメソッド名がシンボルで管理されている。
'apple'.methods #=> [:include?, :unicode_nomalize,.........]



#
# 続・ハッシュについて
#

# 新しいキーと値の組み合わせを追加する
currencies = { :japan=>'yen', :us=>'dollar', :india=>'rupee' }
currencies[:italy] #=> "euro"


# シンボルがキーになる場合、=>を使わず、
# "シンボル： 値"という記法でハッシュを作成できる。キーが文字列の時は=>を使う。
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies[:japan]


# ★キーも値もシンボルの場合は、次のようになる。
# Rubyではこのような記法が多い。p153
{ japan: :yen, us: :dollar, indea: :rupee }



#
# メソッドのキーワード引数とハッシュ p154
#

# どの引数がどんな意味を持つのかわかりづらいときがある。
def buy_burger(menu, drink, potato)
  # ハンバーガーを購入
  if drink
    # ドリンク購入
  end
  if potato
    # ポテト購入
  end
end

# チーズバーガーとドリンクとポテトを購入する
buy_burger('cheese', true, true)


# フィッシュバーガーとドリンクとポテトを購入する
buy_burger('fish', true, true)


# 上記を以下のように書くと、意味が分からない。
buy_burger('cheese', true, true)
buy_burger('fish', true, true)


# こういったケースをメソッドのキーワード引数を使うと、可読性が上がる。
# defメソッド名（キーワード引数１: デフォルト値, キーワード引数２: デフォルト値）


# 上記のbuy_burgerメソッドをキーワード引数にする。
def buy_burger(menu, drink: true, potato: true)
end


# キーワード引数を使う。
buy_burger('cheese', drink: true, potato: false)


# デフォルト値があるため、引数を省略できる。
# デフォルト値を持たない引数は省略不可。
buy_burger('cheese', drink: false)
buy_burger('fish')


# キーワード引数は呼び出し時に順番を入れ替えることができる。

# デフォルト値を設定せず、キーワード引数を設定できる。
def buy_burger(mene, dring:, potato:)
end


# キーワード引数を使うメソッドを呼び出す場合、キーワード引数に一致するハッシュ（キーはシンボル）
# であれば、引数として渡すことができる。
params = { dring: true, potato: false }
buy_burger('fish', params)


#
# 例題：長さの単位変換プログラム
#

# convert_length.rb
# convert_length_test.rb


#
# ハッシュについてもっと詳しく
#

# keys：ハッシュのキーを配列として返す。
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.keys


# values：ハッシュの値を配列として返す。
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.values


# has_key?/key?/include/member?：指定されたキーが存在するか。
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.has_key?(:japan)


# **でハッシュを展開させる。**がmergeでも同じ。
h = { us: 'dooar', indea: 'rupee' }
p "#{{ japan: 'yen', **h }}"


# ハッシュを使った擬似キーワード p163~171 未読


# よく使われるイディオム(1) p173
# if文で、nilでないことをチェックする時、if 変数 = 変数 などとする。


# よく使われるイディオム(2) ||= を使った自己代入

limit ||= 10
# このコードの意味は、変数limitが nil または、falseであれば、10を代入する。
# それ以外は、limitをそのまま使う。

# X ||= A
# 変数XがnilまたはfalseならAを代入。


# よく使われるイディオム(3) !!を使った真偽値の型変換。二重感嘆符。
# 0もfalse
# ! はfalseかどうかを聞いている。
# !!はその逆だが、変数をtrueかfalseに変換するためと解釈。

a = 0
!a
 #=> false 
!!a
 #=> true 
 a = 1
!a
 #=> false 
a = nil
!a
 #=> true 
a = false
!a
 #=> true 
!!a
 #=> false



#
# 楽しいRuby p318
#

wday = { sunday: '日曜日', monday: '月曜日', saturday: '土曜日' }

p wday

p wday.size

wday.each do |a, b|
  p "#{a}は #{b} のことです"
end


