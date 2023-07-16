require "rails_helper"

RSpec.describe ParkService do
  describe "#parks_by_state" do
    it "get park info by state" do
      search = ParkService.new.parks_by_state("TN")
  
      expect(search).to be_a(Hash)

      park = search[:data][0]
      expect(park).to have_key(:fullName)
      expect(park[:fullName]).to be_a(String)

      expect(park).to have_key(:description)
      expect(park[:description]).to be_a(String)

      expect(park).to have_key(:directionsInfo)
      expect(park[:directionsInfo]).to be_a(String)

      expect(park).to have_key(:operatingHours)
      expect(park[:operatingHours][0][:standardHours]).to be_a(Hash)
    end
  end
end