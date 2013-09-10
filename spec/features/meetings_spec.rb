# require 'spec_helper'

# feature 'Signing in by invite_token' do
#   given!(:meeting) { create(:published_meeting) }
#   given!(:participant) { meeting.participants.second }

#   scenario 'when token is correct sign in & redirect to meeting', :slow do
#     visit "#{root_path}?invite_token=#{participant.invite_token}"

#     current_path.should == meeting_path(meeting.id)
#   end

#   scenario 'when token is incorrect redirect to root' do
#     visit "#{root_path}?invite_token=bad-token"

#     current_path.should == root_path
#   end
# end

