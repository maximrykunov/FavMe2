FactoryGirl.define do

  factory :meeting_variant do
    sequence(:name) { |n| "Place #{n}" }
    start_dt Time.now + 5.months
  end
end
