class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html

  def fast_sign_up
    document(Registration) do |x|
      x.may -> { params[:user].present? } do |y|
        y.must -> f { f.set_user(params_for.user_fast_registration) }
        y.may :signup do
          redirect_to root_path, notice: t.devise.registrations.signed_up_with_token_url
        end
        y.may :refresh_token do
          redirect_to root_path, notice: t.devise.registrations.refresh_token_url
        end
        # y.or_fail
      end
    end
  end


  def show
    @user = current_user
    @last_activities = @user.activities.order("created_at desc").limit(10)
  end

end
