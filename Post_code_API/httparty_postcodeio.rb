require 'httparty'
require 'json'

class Postcodeio
  include HTTParty

  attr_accessor :single_postcode_results, :multiple_postcode_results

  base_uri 'https://api.postcodes.io'

  def get_single_postcode (postcode)
    @single_postcode_results = self.class.get("/postcodes/#{postcode}")
    puts JSON.parse(@single_postcode_results.body)
  end

  def post_multiple_postcode (postcodes)
    @multiple_postcode_results = self.class.post("/postcodes/", body:{"postcodes": postcodes})
    puts JSON.parse(@multiple_postcode_results.body)
  end



end

single = Postcodeio.new
single.get_single_postcode("TW106NF")

single.post_multiple_postcode(["IG110RU", "TW106NF"])
