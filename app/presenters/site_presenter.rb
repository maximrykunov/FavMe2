class SitePresenter < ApplicationPresenter
  def home_signup_link
    # link_to t('.new_meeting'), signup_link_path(user_signed_in?)
  end

  private

  def signup_link_path(signed_in)
    signed_in ? new_user_meeting_path(current_user) : users_fast_sign_up_path
  end
end
