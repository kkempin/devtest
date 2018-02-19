class EvaluationService
  attr_reader :country_code, :target_group_id, :locations

  def initialize(country_code, target_group_id, locations)
    @country_code = country_code
    @target_group_id = target_group_id
    @locations = locations
  end

  def calculate(panel_providers_factory = PanelProviders::Factory)
    price_calculator = panel_providers_factory.make(panel_provider)
    price_calculator.price
  end

  private

  def country
    Country.find_by(country_code: @country_code) ||
      TargetGroup.find(target_group_id).countries.first
  end

  def panel_provider
    country.panel_provider
  end
end
