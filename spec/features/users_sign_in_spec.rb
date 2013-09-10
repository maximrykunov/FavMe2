# require 'spec_helper'

# feature 'Signing in' do
#   given(:user) { create(:user) }

#   scenario 'regular sign in', :js do
#     user.token_updated_at = Time.now - User::TOKEN_LIVE_TIME + 1.minute
#     user.save

#     visit root_path

#     find('.header-inside .buttons a.entry-but').click

#     within 'form#new_user' do
#       fill_in 'user[email]', with: user.email
#       fill_in 'user[password]', with: user.password
#       find('input[type=submit]').click
#     end

#     sleep 1

#     current_path.should == meetings_path
#   end
# end

# feature 'Allow signing in by auth_token' do
#   given(:user) { create(:user) }

#   scenario "redirect to new user's meeting" do
#     visit "#{root_path}?auth_token=#{user.authentication_token}"

#     current_path.should == new_meeting_path
#   end

#   scenario "redirect to user's meetings" do
#     create(:published_meeting, user: user)
#     visit "#{root_path}?auth_token=#{user.authentication_token}"

#     current_path.should == meetings_path
#   end
# end

# feature 'Deny signing in by auth_token' do
#   given(:user) { create(:user) }

#   scenario 'deny and put message with token refresh' do
#     user.update_column(:token_updated_at,
#       Time.now - User::TOKEN_LIVE_TIME - 1.minute)
#     visit "#{root_path}?auth_token=#{user.authentication_token}"

#     current_path.should == root_path
#   end
# end

