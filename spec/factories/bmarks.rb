FactoryGirl.define do
  factory :bmark do
    sequence(:name) { |i| "Example Benchmark Number #{i}" }
    description { "Description of #{name.to_s.downcase}" }
    track nil
    stage nil
  end
end
