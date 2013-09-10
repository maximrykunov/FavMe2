PermitParams = Struct.new(:params, :user) do
  def user
    params.require(:user).permit(*user_attrs).tap do |whitelisted|
      whitelisted[:properties] = params[:user]['properties']
    end
  end

  def user_fast_registration
    params.require(:user).permit(:email)
  end

  # ----------------------------------------------------------------------------

  def user_attrs
    %i{name email phone password password_confirmation confirmation_code properties}
  end
end
