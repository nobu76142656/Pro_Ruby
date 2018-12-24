require 'minitest/autorun'
require '../lib/gate'
require '../lib/ticket'

class GateTest < Minitest::Test
  # Minitestではsetupメソッドを定義するとテストメソッドの実行前に実行される。
  def setup
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end
    
  
  def test_umeda_to_juso
    # シナリオ1
    # ・150円の切符を購入する。
    # ・梅田で入場し、十三で出場する。
    # ・期待する結果：出場できる。
    ticket = Ticket.new(150)
    
    @umeda.enter(ticket)
    assert @juso.exit(ticket)
  end
  
  def test_umeda_to_mikuni_when_fare_is_not_enough
    # シナリオ2
    # 150円の切符を購入する。
    # 梅田で入場し、三国で出場する。
    # 期待する結果：出場できない。
    ticket = Ticket.new(150)
    @umeda.enter(ticket)
    
    # refute：実行結果が偽なのかをチェック
    refute @mikuni.exit(ticket)
  end
end




