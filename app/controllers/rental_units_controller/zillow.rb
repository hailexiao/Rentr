class RentalUnitsController::Zillow
  include HTTParty
  base_uri 'http://www.zillow.com'
  debug_output

  def initialize(unit)
    @address = unit.street_address
    @citystatezip = unit.city_state_zip
    @options = { query: {:'zws-id' => ENV["ZWSID"], address: @address,
                         citystatezip: @citystatezip, rentzestimate: true }}
    response = self.class.get('/webservice/GetDeepSearchResults.htm', @options)
    @rent_zestimate = response["searchresults"]["response"]["results"]["result"]["rentzestimate"]["amount"]["__content__"].to_i
  end

  def get_rent_zestimate
    @rent_zestimate
  end
end
