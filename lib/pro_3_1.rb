#
# テストを自動化する
#

# fizz_buzz.rb
# fizz_buzz_test.rb

# assert_equal 期待する結果, テスト対象となる値や式


# aがbと等しければパスする
# assert_equal b, a


# aが真であればパスする
# assert a


# aが偽であればパスする
# refute a


require 'minitest/autorun'

# テストコードが書かれたファイルの名前はクラス名と合わせる。
# クラスの名前はキャメルケースで、ファイルの名前はスネークケースで書く。


# Minitestはtest_で始まるメソッドを探してそれを実行する。
# なので、テストのメソッドはtest_にしなければならない。

# メソッドは複数定義できる。


sample_test.rb
class SampleTest < Minitest::Test
  def test_sample
    
    # assert_equal 期待する結果, テスト対象となる値や式
    assert_equal 'RUBY', 'ruby'.upcase
    
  end
end







