require "rails_helper"

RSpec.describe SearchFacade do
  describe "#parks" do
    it "can make park objects" do
      parks_data = SearchFacade.new("TN").parks

      expect(parks_data).to be_an(Array)
      expect(parks_data.count).to eq(15)

      parks_data.each do |park|
        expect(park).to be_a(Park)
        expect(park.description).to be_a(String)
        expect(park.directions_info).to be_a(String)
        expect(park.full_name).to be_a(String)
        expect(park.standard_hours).to be_a(Hash)
      end

    end
  end
end