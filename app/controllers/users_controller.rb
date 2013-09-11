class UsersController < Devise::RegistrationsController
  respond_to :html

  def show
    @user = params[:id].present? ? User.find(params[:id]) : current_user 
    if current_user != @user
      @friendship = Friendship.between_users(current_user, @user).first_or_create
      @friends = Friendship.for_user(@user.id).by_state('active')
    end
  end
end