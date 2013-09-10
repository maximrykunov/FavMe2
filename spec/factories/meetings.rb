FactoryGirl.define do
  factory :meeting do
    sequence(:name) { |n| "Meeting #{n}" }
    invitations ' ,email1@to_invite.ru email2@to_invite.ru, email3@to_invite.ru;email4@to_invite.ru ,'
    properties {}
    association :user
    # association :type, factory: :service_type

    factory :published_meeting do
      before :create do |m|
        create(:participant, owner: m)
        create(:meeting_time, meeting: m)
        create(:meeting_place, meeting: m)
      end
      after :create do |m|
        m.update_column(:state, 'published')
        create(:vote_stage, owner: m)
      end
    end
  end
end
