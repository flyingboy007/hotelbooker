require 'hotelbooker/models'
require "helpers/sequel"


FactoryGirl.define do
  factory :extra do
    name "My Extra"
  end

  factory :hotel do
    name "My hotel"
    room_count 10
  end

  factory :hotel_with_extras, class: Hotel do
    name "My hotel with Extras"
    room_count 10
    after(:create) do |hotel, evaluator|
      create_list(:extra, 3, hotel: hotel)
    end
  end

end