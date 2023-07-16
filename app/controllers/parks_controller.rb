class ParksController < ApplicationController
  def index
    # @facade = SearchFacade.new(params[:state])
    state = params[:state]

    conn = Faraday.new(url: "https://developer.nps.gov") do |faraday|
      faraday.params["api_key"] = ENV["NPS_KEY"]
    end

    response = conn.get("/api/v1/parks?stateCode=#{state}")

    json = JSON.parse(response.body, symbolize_names: true)
    @parks = json[:data].map do |park_data|
      Park.new(park_data)
    end
  end
end