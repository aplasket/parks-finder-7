require "rails_helper"

RSpec.describe Park do
  describe "#initialize" do
    it "exists and has attributes" do
      data = {
        fullName: "Bees Knees",
        description: "A parks & rec phenomenon",
        directionsInfo: "You'll want a magnifying glass",
        operatingHours: [standardHours: {:wednesday=>"9:00AM - 4:00PM",
        :monday=>"Closed",
        :thursday=>"9:00AM - 4:00PM",
        :sunday=>"9:00AM - 4:00PM",
        :tuesday=>"Closed",
        :friday=>"9:00AM - 4:00PM",
        :saturday=>"9:00AM - 4:00PM"}]
      }

      new_park = Park.new(data)
      expect(new_park).to be_a(Park)
      expect(new_park.full_name).to eq("Bees Knees")
      expect(new_park.description).to eq("A parks & rec phenomenon")
      expect(new_park.directions_info).to eq("You'll want a magnifying glass")

      expected_results = {
        :sunday=>"9:00AM - 4:00PM",
        :monday=>"Closed",
        :tuesday=>"Closed",
        :wednesday=>"9:00AM - 4:00PM",
        :thursday=>"9:00AM - 4:00PM",
        :friday=>"9:00AM - 4:00PM",
        :saturday=>"9:00AM - 4:00PM" }
      expect(new_park.standard_hours).to eq(expected_results)
    end
  end
end