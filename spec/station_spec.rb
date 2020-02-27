require 'station'

describe Station do
let(:station) {Station.new("aldgate", 1)}

  it "checks the station name" do
    expect(station.name).to eq ("aldgate")
  end

  it "checks the zone number" do
    expect(station.zone).to eq 1
  end
end
