FactoryGirl.define do
  factory :track do
    sequence(:name) { |i| "Example Track #{i}" }
    association :location
  end
end
