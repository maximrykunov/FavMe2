module FeatureMacros
  extend ActiveSupport::Concern

  def do_sign_in!(user = create(:user))
    visit('/users/sign_in')

    find('form#new_user #user_email').set user.email
    find('form#new_user #user_password').set '111111'
    find('form#new_user input[type=submit]').click
  end
end
