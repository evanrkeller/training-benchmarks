FactoryGirl.define do
  factory :sign_off do
    association :user
    association :bmark
  end
end
