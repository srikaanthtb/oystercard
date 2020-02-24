require 'oystercard'
describe Oystercard do
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

  it "deducts fare from the card" do
    subject.top_up(50)
    expect{subject.deduct(5)}.to change {subject.balance}.by(-5)
  end
end
