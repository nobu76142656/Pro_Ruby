#
# 単位変換メソッド
#

# 変換後の単位の長さ=変換前の単位の長さ/変換前の単位の比率*変換後の単位の比率

# 1メートルをインチに直すのであれば、
# 39.37 = 1 / 1.0 * 39.37

# 1フィートをメートルに直す
# 0.30 = 1.to_f / 3.28 * 1.0


# def convert_length(length, unit_from, unit_to)
#   units = { m: 1.0, ft: 3.28, in: 39.37 }
#   #変換前の単位の長さ/変換前の単位の比率*変換後の単位の比
#   (length / units[unit_from] * units[unit_to]).round(2)
# end


# 上記をキーワード引数を使うようにする
def convert_length(length, from: :m, to: :m)
  units = { m: 1.0, ft: 3.28, in: 39.37 }
  #変換前の単位の長さ/変換前の単位の比率*変換後の単位の比
  (length / units[from] * units[to]).round(2)
end


# ここでのハッシュは特にキーや値が追加されない。
# こういうオブジェクトはメソッドの外で定数として定義。

UNITS = { m: 1.0, ft: 3.28, in: 39.37 }
def convert_length(length, from: :m, to: :m)
  #変換前の単位の長さ/変換前の単位の比率*変換後の単位の比
  (length / UNITS[from] * UNITS[to]).round(2)
end






