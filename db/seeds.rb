panel_provider_1 = PanelProvider.create(code: 'Panel1')
panel_provider_2 = PanelProvider.create(code: 'Panel2')
panel_provider_3 = PanelProvider.create(code: 'Panel3')

panel_providers = [panel_provider_1, panel_provider_2, panel_provider_3, panel_provider_1]

country_pl = Country.create(country_code: 'pl', panel_provider: panel_provider_1)
country_de = Country.create(country_code: 'de', panel_provider: panel_provider_2)
country_uk = Country.create(country_code: 'uk', panel_provider: panel_provider_3)

countries = [country_pl, country_de, country_uk]

location_group_1 = LocationGroup.create(
  name: 'LocationGroup1',
  panel_provider: panel_provider_1,
  country: country_pl
)

location_group_2 = LocationGroup.create(
  name: 'LocationGroup2',
  panel_provider: panel_provider_2,
  country: country_de
)

location_group_3 = LocationGroup.create(
  name: 'LocationGroup3',
  panel_provider: panel_provider_3,
  country: country_uk
)

location_group_4 = LocationGroup.create(
  name: 'LocationGroup4',
  panel_provider: panel_provider_1,
  country: country_pl
)

location_groups = [location_group_1, location_group_2, location_group_3, location_group_4]

1.upto(20) do |index|
  location = Location.create(
    name: "Location#{index}",
    external_id: 100 + index,
    secret_code: "secret_code_location_#{index}"
  )

  how_many_location_groups = (1..4).to_a.sample
  how_many_location_groups.times do
    location.location_groups << location_groups.sample
  end
end

1.upto(4) do |index|
  target_group_name = "TargetGroup#{index}"
  target_group_root = TargetGroup.create(
    name: target_group_name,
    external_id: Digest::MD5.hexdigest(target_group_name),
    secret_code: Digest::SHA256.hexdigest(target_group_name),
    parent_id: nil,
    panel_provider: panel_providers[index - 1]
  )

  target_group_root.countries << target_group_root.panel_provider.countries.first

  TargetGroupTreeBuilder.new(panel_providers).run(target_group_root)
end
