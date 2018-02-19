class TargetGroupsForCountryQuery

  def initialize(country_code)
    @country_code = country_code.downcase
  end

  def fetch
    TargetGroup.
      roots.
      joins(:countries).
      where('countries.country_code = ?', @country_code).
      where('countries.panel_provider_id = target_groups.panel_provider_id')
  end
end
