require 'hotelbooker/models'

FactoryGirl.define do
  factory :extra

  factory :hotel do
    name "My hotel"
  end

  factory :hotel_with_extras, class: Hotel do
    name "My hotel with Extras"
    after(:create) do |hotel, evaluator|
      create_list(:extra, 3, hotel: hotel)
    end
  end

end