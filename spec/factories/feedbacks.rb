FactoryGirl.define do
  factory :feedback do
    association :user
    association :practice
    note "MyText"
  end

end
