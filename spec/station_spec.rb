require 'station'

describe Station do
  it "assigns a name for every new station" do
    station = Station.new("station_name", "station_zone")
    expect(station.name).to eq "station_name"
  end

  it "assigns a zone for every new station" do
    station = Station.new("station_name", "station_zone")
    expect(station.zone).to eq "station_zone"
  end
end
