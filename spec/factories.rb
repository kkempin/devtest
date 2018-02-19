FactoryGirl.define do
  factory :panel_provider do
    sequence :code do |n|
      "Panel#{n}"
    end
  end

  factory :country do
    sequence :country_code do |n|
      "C#{n}"
    end

    panel_provider
  end

  factory :target_group do
    name 'target group'
    sequence :external_id do |n|
      n
    end
    parent_id nil
    sequence :secret_code do |n|
      "secret_code_#{n}"
    end
    panel_provider
  end

  factory :location_group do
    name 'LocationGroup'
    country
    panel_provider
  end

  factory :location do
    name 'LocationGroup'
    sequence :external_id do |n|
      n
    end
    sequence :secret_code do |n|
      "secret_code_#{n}"
    end
  end
end
