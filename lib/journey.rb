require_relative 'oystercard'
require_relative 'station'
class Journey
attr_reader

  def touch_in(entry_station)
    raise "not enough money to make journey" if @balance < @min_balance
    @entry_station = entry_station
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
end
