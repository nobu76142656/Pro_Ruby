#
# モジュールを理解する
#

class Product
  def title
    # logメソッドを実行
    log 'タイトルを呼ぶ'
    p '良い映画'
  end

  private
  # クラスが違うがlogメソッドは同じ
  def log(text)
    puts "[LOG] #{text}"
  end
end

class User
  def name
    # logメソッドを実行
    log '名前を呼ぶ'
    p 'アリス'
  end

  private
  # クラスが違うがlogメソッドは同じ
  def log(text)
    puts "[LOG] #{text}"
  end
end

product = Product.new
product.title

user = User.new
user.name

# 上記の2つのログを出力する処理が重複している。コードが重複しているからといって安易に
# 継承を使ってはいけない。継承は「製品はユーザーである」または「ユーザーは製品である」といった
# is-a関係が成り立つ時に使う。今回はそうで無いので避けるべき。

# 継承は使えないが、ログを出力するという共通の昨日は持たせたい時にモジュールを使う。


# ログ出力用のメソッドを提供するモジュール
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  # モジュールをinclude
  include Loggable

  def title
    log "logメソッドに渡しているテキスト"
    p 'これは出力されるか？'
  end
end

product = Product.new
product.title

# railsではApplicationControllerでSessionsHelperをincludeしている
# SessionsControllerはApplicationControllerを継承している



