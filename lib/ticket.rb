class Ticket
  attr_reader :fare, :stamped_at
  
  def initialize(fare)
    @fare = fare
  end
  
  # stampメソッド：
  # 駅名を受け取りTicketクラスのインスタンスに保存。
  def stamp(name)
    @stamped_at = name
  end
  
end