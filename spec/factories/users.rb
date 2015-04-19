FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    sequence(:email) { |i| "user#{i}@example.com" }
    password 'password'
    phone '2125550001'
    association :track
  end
end
