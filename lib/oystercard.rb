class Oystercard
  attr_reader :balance, :max_balance, :limit, :status, :min_balance, :min_charge, :entry_station, :exit_station,
   :journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MINIMUM_CHARGE = 5
  def initialize
    @journey = []
    @balance = 0
    @max_balance = MAX_BALANCE
    @min_balance = MIN_BALANCE
    @min_charge =  MINIMUM_CHARGE
    @entry_station = nil
    @exit_station = nil
  end
  def top_up(money)
    @balance += money
    limit(money)
    balance_message
  end



def touch_in(entry_station)
  raise "not enough money to make journey" if @balance < @min_balance
  @entry_station = entry_station
  @journey.push(entry_station)
  
end

def in_journey?
  !!entry_station
end

def touch_out(exit_station)
  @exit_station = exit_station
  deduct(@min_charge)
  @journey.push({entry_station:entry_station, exit_station:exit_station})
  @entry_station = nil
  
  exit_station
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
