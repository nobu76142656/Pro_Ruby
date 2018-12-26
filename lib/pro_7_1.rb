#
# クラスの作成を理解する
#


# ハッシュは新しくキーを追加したり内容を変更したりできるので
# 「もろくて壊れやすいプログラム」になりがち。


# Userクラスを定義する
class User
  # あえて、attr_accessorは使っていない。
  # attr_reader は読み取り専用メソッドを自動定義。
  attr_reader :first_name, :last_name, :age
  
  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
  
  # 氏名を作成するメソッド
  def full_name
    "#{first_name} #{last_name}"
  end
  
end

# ユーザーのデータを作成する
# users = []
# users << User.new('Alice','Ruby', 20)
# users << User.new('Bob','Python', 30) 

# ユーザのオブジェクトを作成する
alice = User.new('Alice','Ruby', 20)
bob = User.new('Bob','Python', 30) 

# ユーザのデータを表示する
# users.each do |user|
#   puts "氏名：#{user.full_name(user)}、年齢：#{user.age}"
# end

p alice.last_name
p bob.age

p alice.full_name


# このように、クラスをもとにして造られたデータの塊を
# オブジェクト、あるいはインスタンスと呼ぶ。
# オブジェクトのことをレシーバと呼ぶことも良くある。

# user = User.new('Alice','Ruby', 20)
# user.first_name

# userというレシーバに対して、
# first_nameというメッセージを送っている。

# 外部から取得したり変更したりできる値のことを属性
# （もしくはアトリビュートやプロバティ）と呼ぶ。属性の名前は名詞。
# 変更するにはそのためのメソッドを作る。

p alice.first_name



#
# クラスの定義
#

# クラス名は必ず大文字から始める。小文字から始めるとエラーとなる。


# オブジェクトを作成するには newメソッドを使う。
# newメソッドでオブジェクトを作る時呼ばれるのがinitializeメソッド。
# コンストラクタのようなもの。


# initializeメソッドに引数をつけると# newメソッドを呼ぶときにも
# 引数が必要。


# クラス内でメソッドを定義すると、インスタンスメソッドになる。


# クラスの内部で定義されるインスタンス変数は、同じインスタンス、
# (同じオブジェクト)の内部で共有される変数。@で始める。


class User
  # @nameを編集するメソッドが自動的に定義される。
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def hello
    "I am #{@name}."
  end
  
  # インスタンス変数を外部から変更するためのメソッド
  # attr_accessorの定義によって、記述の必要はない。
  def edit_name(value)
    @name = value
  end
  
  # =を使ったメソッド
  def edit_name_i=(value)
    @name = value
  end
end

user = User.new('Shinji')

p user.hello

# 一方、メソッドやブロックの内部で作成されるのがローカル変数。
# ローカル変数は参照する前に必ず値を代入して作成する必要がある。


# インスタンス変数は外部から参照・変更できない。
# 参照・変更するにはメソッドを作る。


# Rubyでは=で終わるメソッドを定義すると、変数に代入するような形で
# そのメソッドを呼び出せる。

user.edit_name('imai')
p user.hello

# 変数に代入しているわけではない。=付きメソッドを呼び出している。
user.edit_name_i = ('saito')
p user.hello


# このようにインスタンスメソッドの読み書きするメソッドを
# アクセサメソッドという。


# Rubyの場合は
# attr_accessor :name
# とすればアクセサメソッドを定義する必要はない。p216

user.name = 'aoki'
p user.name
p user.hello


# 読み取り専用のメソッドだけを自動定義は attr_reader
# 書き込み専用のメソッドだけを自動定義は attr_writer

# ,(カンマ)で複数1度に定義できる。
# attr_accessor :name, :age




#
# クラスメソッドの定義 self p218
#

class User
  def initialize(name)
    @name = name
  end

  # これはインスタンスメソッド
  def hello
    # @nameの値はインスタンスによって異なる
    "Hello, I am #{name}"
  end
end

# alice = User.new('Alice')
# インスタンスメソッドはインスタンス（オブジェクト)に対して呼び出す。
# alice.hello #=> "Hello, I am Alice"

# bob = User.new('Bob')
# インスタンスによって内部データが異なるので結果もいなる。
# bob.hello #=> "Hello, I am Bob"

# インスタンス変数を読み書きする場合にはインスタンスメソッドを定義。


# 一方、そのクラスに関連深いものの、ひとつひとつのインスタンス
# に含まれるデータは使わないメソッドを定義する場合。
# その場合はクラスメソッドを定義した方が使い勝手が良い。

# クラスメソッドを定義する方法はメソッド名の前にself.を付ける。

class User
  def initialize(name)
    @name = name
  end
  
  # 名前の配列を渡すとUserクラスのインスタンスを配列に入れて返す。
  def self.create_users(names)
    names.map do |n|
      User.new(n)
    end
  end
  

  # これはインスタンスメソッド
  def hello
    # @nameの値はインスタンスによって異なる
    "Hello, I am #{@name}"
  end
end

names = ['Alice','Bob','Carol']
users = User.create_users(names)
users.each do |user|
  puts user.hello
end


# メソッドの記法について、Rubyでは
# インスタンスメソッドを表す場合には"クラス名#メソッド名"と書くことがある。
# クラスメソッドの場合は"クラス名.メソッド名"(または"クラス名::メソッド名")。


#
# 例題：改札機プログラム
#

# gate_test.rb
# gate.rb

# APIドキュメント生成
# rdoc lib/gate.rb


#
# selfキーワード p233
#

class User
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def hello
    # selfなしでnameメソッドを呼ぶ
    "Hello, #{name}"
  end
  
  def hi
    # self付きでnameメソッドを呼ぶ
    "Hi, #{self.name}"
  end
  
  def my_name
    # 直接インスタンス変数の@nameにアクセスする
    "My name is #{@name}"
  end
end

# どの書き方が正解とは言えない。


# selfの付け忘れで不具合が発生するケース。
class User
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def rename_to_bob
    # selfなしでname = メソッドを呼ぶ？
    # nameというローカル変数にBobを代入したと解釈されてしまう。
    # このようなセッターメソッドの場合は必ずselfを付ける。
    name = 'Bob'
  end
  
  def rename_to_carol
    # self付きにしなければならない。
    self.name = 'Carol'
  end
  
  def rename_to_dave
    # 直接インスタンス変数を書き換える
    @name = 'Dave'
  end
end


# クラスメソッドやクラス構文直下のself p235
class Foo
  # クラス構文直下のselfはFooと表示され、Fooクラス自身を表す。
  puts "クラス構文直下のself: #{self}"
  
  def self.bar
    # クラスメソッド内のselfもFooクラス自身を表す。
    puts "クラスメソッド内のself: #{self}"
  end
  
  def baz
    # インスタンスメソッド内ではFooクラスのインスタンスを表す。
    puts "インスタンスメソッド内のself: #{self}"
  end
end

# クラスメソッドをインスタンスメソッドの内部から呼び出す場合は
# クラス名.メソッド

#
# 7.6 クラスの継承 p238 2018/12/24 （ここから再開）
#

# railsのSessionsControllerもclass。rubyの標準ライブラリも継承している。
# ses = SessionsController.new でオブジェクトとしても生成できる。


# < で継承している
# super でスーパークラスのメソッドを呼び出す
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

product = Product.new('すばらしい映画', 1000)
p product.name
p product.price


# DVDクラスでこれに加えて再生時間(running_time)を持たせる
class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    @name = name
    @price = price
    @running_time = running_time
  end
end

dvd = DVD.new('すばらしい映画', 1000, 120)
p dvd.name
p dvd.price
p dvd.running_time

# nameとpriceについてはスーパークラスのinitializeメソッドでも同じように値を代入している
# 全く同じ処理を書くならsuperでスーパークラスの処理を呼ぶ。

class DVD < Product
  attr_accessor

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end
end

# もし仮に、スーパークラスとサブクラスで引数の数が同じだった場合は、
# 引数なしのsuperを呼ぶだけで自分に渡された引数を全てスーパークラスに引き渡すことができる。

#
# メソッドのオーバーライド
#

# to_sメソッド（オブジェクトの内容を文字列に変換して返す）Objectクラスで定義されているので、
# 全てのオブジェクトで使える。
product = Product.new('エキサイト', 1000)
p product.to_s

# to_sメソッドをオーバーライドする
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "name: #{name}, price: #{price}"
  end
end

product = Product.new('エキサイト', 1000)
p product


#
# 定数について
#

# 定数はクラスの外部から直接参照することが可能
# クラス名::定数名
# 定数はメソッド内部で作成することはできない。必ずクラス構文の直下で作成する必要がある
# 定数の再代入も可能

# クラスの外部から定数を参照するコード
class Product
  DEFAULT_PRICE = 0
end

p Product::DEFAULT_PRICE

# freezeでクラス外部からの再代入を防げる
Product.freeze
Product::DEFAULT_PRICE = 5000
# =>エラーとなる

# freezeはデメリットが大きいので普通はしない

#
# 様々な種類の変数
#

# インスタンス変数はクラスをインスタンス化（クラス名.newでオブジェクトを作成)した際にオブジェクトごとに管理
# クラスインスタンス変数はインスタンスの作成とは無関係に、クラス自身が保持しているデータ
#（クラス自身のインスタンス変数)
# クラス構文の直下や、クラスメソッドの内部で@で始まる変数を操作するとクラスインスタンス変数にアクセスしている

class Product
  # クラスインスタンス変数
  @name = 'Product'

  def self.name
    # クラスインスタンス変数
    @name
  end

  def initialize(name)
    # インスタンス変数
    @name = name
  end

  def name
    # インスタンス変数
    @name
  end

end



