class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190]
  
  def initialize(name)
    @name = name
  end
  
  # Ticketクラスのstampメソッドを呼び出し自分の駅名を渡す。
  def enter(ticket)
    ticket.stamp(@name)
  end
  
  
  # 引数として渡された切符(Ticket)から運賃(fare)と乗車駅を取得。
  # indexメソッドは配列の中から引数に合致する要素の添え字を取得。
  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end
  
  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    
    distanse = to - from
    FARES[distanse - 1]
  end

end