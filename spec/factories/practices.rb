FactoryGirl.define do
  factory :practice do
    start_time '2015-03-10 19:00:00'
    end_time '2015-03-10 20:00:00'
    association :stage
    association :location
  end
end
