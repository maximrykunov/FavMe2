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
    @user = params[:id].present? ? User.find(params[:id]) : current_user 
    if current_user != @user
      @friendship = Friendship.between_users(current_user, @user).first_or_create
      @friends = Friendship.for_user(@user.id).by_state('active')
    end
  end

end
