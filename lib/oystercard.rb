class Oystercard
  attr_reader :balance, :max_balance, :limit, :status, :min_balance, :min_charge, :entry_station
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MINIMUM_CHARGE = 5
  def initialize
    @balance = 0
    @max_balance = MAX_BALANCE
    @min_balance = MIN_BALANCE
    @min_charge =  MINIMUM_CHARGE
    @entry_station = nil
  end
  def top_up(money)
    @balance += money
    limit(money)
    balance_message
  end



def touch_in(station)
  raise "not enough money to make journey" if @balance < @min_balance
  @entry_station = station
end

def in_journey?
  !!entry_station
end

def touch_out
  deduct(@min_charge)
  @entry_station = nil
end


  private

  def deduct(fare)
    @balance -= fare
    balance_message
  end

  def limit(money)
    (@balance = @max_balance; raise "top up limit exceeded") if @balance > @max_balance
  end

  def balance_message
      "You have £#{@balance} remaining"
  end
end
