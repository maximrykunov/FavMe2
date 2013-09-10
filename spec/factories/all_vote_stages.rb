FactoryGirl.define do
  # factory :vote_stage do
  #   association :meeting, factory: :meeting
  # end

  factory :vote_stage, class: VoteStage do
    variant_id 0
    message 'message'
    association :owner, factory: :meeting
  end

  # factory :funding_vote_stage, class: VoteStage do
  #   association :owner, factory: :funding
  # end
end
