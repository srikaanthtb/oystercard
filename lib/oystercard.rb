class Oystercard
  attr_reader :balance, :max_balance, :limit
  MAX_BALANCE = 90
  def initialize
    @balance = 0
    @max_balance = MAX_BALANCE
  end
  def top_up(money)
    @balance += money
    limit(money)
  end

  def deduct(fare)
    @balance -= fare
  end

  private

  def limit(money)
    (@balance = @max_balance; raise "top up limit exceeded") if @balance > @max_balance
  end
end
