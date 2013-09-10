FactoryGirl.define do
  factory :vote do
    association :vote_stage, factory: :vote_stage
    mind 'accepted'
  end
end
