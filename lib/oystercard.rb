require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey, :journey_history
  MAX_BALANCE = 90
  MIN_FARE = 1
  def initialize
    @balance = 0
    @journey = Journey.new
    @journey_history = []
  end

  def top_up(value)
    fail "Top up limit of #{MAX_BALANCE} exceeded" if value > MAX_BALANCE
    @balance += value
  end

  def touch_in(entry_station)
    fail "Not enough money in your card" if @balance < MIN_FARE
    @journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish_journey(exit_station)
    @balance = deduct(MIN_FARE)
    @journey_history << @journey.current_journey
    @journey.current_journey = nil
  end

  private

  def deduct(amount)
    fail "Not enough money in your card" if amount > @balance
    @balance -= amount
  end

end
