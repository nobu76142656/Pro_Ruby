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





