module RequestMacros
  extend ActiveSupport::Concern

  def do_sign_in!(user = create(:user))
    post new_user_session_path, { user: { email: user.email, password: '111111' } }
    user
  end
end
