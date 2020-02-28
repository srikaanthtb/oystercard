require_relative 'oystercard'

class Journey
attr_reader :entry_station, :exit_station
attr_accessor :current_journey
  PENALTY = 6

  def initialize
    @entry_station = nil
    @exit_station = nil
    @current_journey = nil

  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def finish_journey(exit_station)
    fail "Currently not travelling" if @entry_station == nil
    @exit_station = exit_station
    @current_journey = {:entry_station => @entry_station, :exit_station => @exit_station}
   @entry_station = nil
  end

  def in_journey?
    !!@entry_station  # converts @entry_station in a boolean (will return true for any value thats not nil/false)
    # if @entry_station != nil
    #   return true
    # else false
    # end
  end

  def fare
    @current_journey.nil? ? PENALTY : Oystercard::MIN_FARE
  end

end
