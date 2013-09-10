require 'spec_helper'

feature 'Signing up' do
  # scenario 'fast registration by email' do
  #   visit root_path
  #   find('.header-inside a.btn.fancybox').click

  #   within 'form#new_fast_sign_up_user_form' do
  #     fill_in 'user[email]', with: 'new_fast_user@local.ru'
  #     expect { find('input[type=submit]').click }.to change { User.count }.by(1)
  #   end

  #   ActionMailer::Base.deliveries.last.to.should == ['new_fast_user@local.ru']
  #   current_path.should == users_fast_sign_up_path
  # end

  # scenario 'refresh auth token when email already exist' do
  #   user = create(:user)
  #   visit root_path
  #   find('.header-inside a.btn.fancybox').click

  #   within 'form#new_fast_sign_up_user_form' do
  #     fill_in 'user[email]', with: user.email
  #     expect { find('input[type=submit]').click }.not_to change { User.count }
  #   end

  #   ActionMailer::Base.deliveries.last.to.should == [user.email]
  #   current_path.should == users_fast_sign_up_path
  # end

  # scenario 'full sign up', :js do
  #   user_attrs = attributes_for(:user)

  #   visit root_path

  #   find('.header-inside .buttons a.reg-but').click

  #   within 'form#new_user' do
  #     fill_in 'user[name]', with: user_attrs[:name]
  #     fill_in 'user[email]', with: user_attrs[:email]
  #     fill_in 'user[password]', with: user_attrs[:password]
  #     fill_in 'user[password_confirmation]', with: user_attrs[:password]
  #     find('input[type=submit]').click
  #   end
  #   # Capybara.default_wait_time = 4
  #   page.should have_selector('#sign_up_notice')
  #   User.last.email.should == user_attrs[:email]
  # end

end

