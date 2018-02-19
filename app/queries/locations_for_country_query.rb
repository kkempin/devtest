class LocationsForCountryQuery

  def initialize(country_code)
    @country_code = country_code.downcase
  end

  def fetch
    Location.
      joins(:location_groups).
      where(location_groups: { panel_provider_id: country_subquery }).
      distinct
  end

  private

  def country_subquery
    Country.
      where(country_code: @country_code).
      select(:panel_provider_id)
  end
end
