require 'journey'

describe Journey do

  it "initializes with #in_journey? false" do
    expect(subject.in_journey?).to eq false
  end

  describe "#start_journey" do

    it "#in_journey? returns true if #start_journey" do
      subject.instance_variable_set(:@balance, 10) # Sets an instance variable to chosen value
      subject.start_journey("entry_station")
      expect(subject.in_journey?).to be true
    end

    it "saves the entry_station at #start_journey" do
      # card = double()
      # allow(card).to receive(:touch_in).with("station_name")
      subject.instance_variable_set(:@balance, 10)
      subject.start_journey("entry_station")
      expect(subject.entry_station).to eq "entry_station"
    end
  end

  describe "#finish_journey" do

    it "#finish_journey raises error if #in_journey? is false" do
      expect{subject.finish_journey("exit_station")}.to raise_error("Currently not travelling")
    end

    it "saves the exit_station at #finish_journey" do
      subject.instance_variable_set(:@balance, 10)
      subject.start_journey("entry_station")
      subject.finish_journey("exit_station")
      expect(subject.exit_station).to eq "exit_station"
    end

    it 'stores entry and exit in @current_journey' do
      subject.instance_variable_set(:@balance, 10)
      subject.start_journey("entry_station")
      subject.finish_journey("exit_station")
      expect(subject.current_journey).to eq({:entry_station => "entry_station",:exit_station => "exit_station"})
    end

    it "#in_journey? returns false after #finish_journey" do
      subject.instance_variable_set(:@balance, 10)
      subject.start_journey("entry_station")
      subject.finish_journey("exit_station")
      expect(subject.in_journey?).to be false
    end

    it "resets the entry_station to nil at #finish_journey" do
      subject.instance_variable_set(:@balance, 10)
      subject.start_journey("entry_station")
      subject.finish_journey("exit_station")
      expect(subject.entry_station).to eq nil
    end
  end

describe "#fare" do
   it "calculates fare for correct journey" do
     subject.instance_variable_set(:@balance, 10)
     subject.start_journey("entry_station")
     subject.finish_journey("exit_station")
     expect(subject.fare).to eq(Oystercard::MIN_FARE)
   end
end

end
