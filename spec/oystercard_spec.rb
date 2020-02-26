require 'oystercard'

describe Oystercard do
let(:station) { double :station}

  it "checks a default balance" do
    expect(subject).to have_attributes(balance: 0)
  end
  it "allows card to be topped up" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it "tops up card with money" do
    expect{subject.top_up(20)}.to change {subject.balance}.by(20)
  end

  it "puts an error of balance is over the max" do
    expect{subject.top_up(100)}.to raise_error "top up limit exceeded"

  end
  it "puts an error of balance is over the max" do
    subject.top_up(50)
    expect{subject.top_up(70)}.to raise_error "top up limit exceeded"
  end

  it "charges money when journey starts" do
    subject.top_up(50)
    subject.touch_in(station)
expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
  end

it "putsd a entry station on touch in" do
  subject.top_up(50)
  subject.touch_in(station)
  expect( subject.entry_station).to eq station
end

describe "#in_journey?" do
  it "check if card is in transit" do
    subject.top_up(50)
    subject.touch_in(station)
    expect(subject.in_journey?).to eq true
  end

  it "makes error if there isnt enough money to make journey" do
    expect{subject.touch_in(station)}.to raise_error "not enough money to make journey"
  end

  it "check if card is not in transit" do
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end
it "check that the station is forgotten on exit" do
  subject.top_up(50)
  subject.touch_in(station)
  subject.touch_out
  expect( subject.entry_station).to eq nil
end

end

end
