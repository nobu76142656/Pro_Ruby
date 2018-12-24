# to_s(16)で整数値を１６進数に変換。to_sは文字列に変換する。
# rjustメソッドで右寄せにすると00と入る。
# rjust(桁数, '埋めたい文字列')
# rjust(5, '0') =>00000

# def to_hex(r, g, b)
#   '#' +
#   r.to_s(16).rjust(2, '0') +
#   g.to_s(16).rjust(2, '0') +
#   b.to_s(16).rjust(2, '0')
# end

# 上記をリファクタリング

# def to_hex(r, g, b)
#   hex = '#'
#   [r, g, b].each do |n|
#     hex += n.to_s(16).rjust(2, '0')
#   end
#   hex
# end

# inject(たたみ込みメソッド)を使ってさらに短くする。
# ブロックの戻り値がinjectメソッド自身の戻り値となる。

def to_hex(r, g, b)
  [r, g, b].inject('#') do |hex, n|
    hex + n.to_s(16).rjust(2, '0')
  end
end


# RGB値に変換する
# 1, 16進数の文字列から２文字づつ取り出す。

# hex = '#12aabcd'
# r = hex[1..2]
# g = hex[3..4]
# b = hex[5..6]


# 2, ２桁の10進数を10進数にの整数に変換する。
# Stringクラスのhexというメソッドを使う。

# '00'.hex => 0
# 'ff'.hex => 255
# '2a'.hex => 42

# 以上を総合する。

# def to_ints(hex)
#   r = hex[1..2]
#   g = hex[3..4]
#   b = hex[5..6]
#   ints = []
#   [r, g, b].each do |s|
#     ints << s.hex
#   end
#   ints
# end

# mapメソッドを使ってリファクタリング
# mapメソッド：空の配列を用意して、他の配列をループ処理した結果を
# 空の配列に入れていく処理の大半はmapメソッドで置き換えられる。

def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  [r, g, b].map do |s|
    s.hex
  end
end

# 新しい配列を返すメソッドなのでわざわざintsのような変数を用意しなくても良い。








