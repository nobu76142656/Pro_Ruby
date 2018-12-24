require 'minitest/autorun'
require '../lib/convert_hash_syntax.rb'

class ConvertHashSyntaxTest < Minitest::Test
  def test_convert_hash_syntax
    
    # 送り込むデータ
    old_syntax = <<~TEXT
      {
        :name => 'Alice'
        :age=>20,
        :gender  =>  :female
      }
    TEXT
    
    # 期待値
    expected = <<~TEXT
      {
        name: 'Alice'
        age: 20,
        gender: :female
      }
    TEXT
    
    assert_equal expected, convert_hash_syntax(old_syntax)
    
  end
end
