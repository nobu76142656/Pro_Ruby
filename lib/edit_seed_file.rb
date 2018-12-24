# ファイルの作成書き込み（プロRubyとは関係なし）

#
# " " と　' ' の違いに注意！シングルクォートの中ではエスケープシーケンスは無効！
#

text = '\n'
p text.gsub('\n', ':')

# todo:ファイルを読み込む
arr = []
arr = File.open('./words.txt').readlines
# =>["expires 有効期限\n", "authenticated 認証\n", "attribute 属性\n", "article 記事\n", "comparison 比較\n", "confirmation 確認\n", "fatal 致命的な\n", "denied 拒 否\n", "rights 権利\n", "verifying 検証\n", "reinitialized 再初期化\n", "correct 正しい\n", "current 現在\n", "store 格納\n", "depends 依存する\n", "assigned 割り当てる\n", "valriable 変数\n", "coerced 強要\n", "integer 整数\n", "arguments 引数\n", "invoke 呼び出す\n", "inspect 検査\n", "expected 期待する\n", "actual  実際\n", "undifined 未定義\n", "assert 主張する\n", "equal 等しい"]

# todo:配列を単なる文字列にする
p arr = arr.join(", ")

# todo:文字列から英単語だけ抜き出してscanの機能で配列にしている。
arr_en = arr.scan(/\w+/)
p arr_en

# todo:文字列から漢字だけ抜き出してscanの機能で配列にしている。
# \p{Hiragana}*[一-龠々]\p{Hiragana}*
arr_ja = arr.scan(/\p{Hiragana}*[一-龠々]+\p{Hiragana}*/)
p arr_ja

# teratail = ["expires 有効期限\n", "authenticated 認証\n", "attribute 属性\n"].map(&:split).flatten.partition{|s| s.match? /^\w+$/ }

# en = ['authenticated','expires',  'attribute','assert']
# ja = ['認証',         '有効期限', '属性',      '主張する']

File.open('./seed.txt', 'w') do |f|
  i = 0
  arr_en.length.times{
    f.puts "
      @word = Word.new
      @word.english = #{arr_en[i]}
      @word.japanese = #{arr_ja[i]}
      @word.save
    "
    i += 1
  }
end




# gsubを使えばよいか？
# replaced = html.gsub(/<option value="(\w+)"(?: selected)?>(.*)<\/option>/, '\1,\2')

# s = ''
# File.open("./words.txt") do |f|
#   s = f.read
# end
# p s


# arr_s = arr.to_s
# MatchDataの配列が得られる。配列を得られる必要はない。
# p arr_s.to_enum(:scan, /"\w+/).map { Regexp.last_match } 


# うまくいかない
# words = [ ['authenticated','expires',  'attribute','assert'],
#           ['認証',         '有効期限', '属性',      '主張する']
#         ]
# words.each do |e|
#   p "@word.english = #{e}"
#   e.each do |j|
#     p "@word.japanese = #{j}"
#   end
# end


# array = [[1,2,3], [4,5,6], [7,8,9]]
# array.each do |a,r,y|
#   puts "多次元：#{a},#{r},#{y}"
# end


# stepメソッドは数値にしか使えない。

# array.each_slice(3).map(&:first)
# https://ref.xaio.jp/ruby/classes/enumerable/each_slice
# require "enumerator"
# a = [1,2,3,4,5,6,7,8]
# a.each_slice(3).map(&:first)
# p a