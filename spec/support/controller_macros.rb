module ControllerMacros
  def do_sign_in!(email = nil, role = '')
    before(:each) do
      # only for controllers that inherits from Devise's
      @request.env["devise.mapping"] = Devise.mappings[:user]

      if email
        user = User.where(email: email).first
        user = FactoryGirl.create(:user, email: email, roles: [role]) unless user
      else
        user = FactoryGirl.create(:user)
      end

      sign_in user
    end
  end

  def do_sign_in_admin!
    do_sign_in!('admin@local.ru', 'admin')
  end

  def do_sign_in_editor!
    do_sign_in!('editor@local.ru', 'editor')
  end

  # def set_current_user
  #   before(:each) do
  #     controller.stub!(:current_user).and_return(current_user)
  #   end
  # end

  def mock_item(model_class, stubs = {}, null_object = false)
    before(:each) do
      @mock_item ||= {}
      model_index = model_class.name.underscore
      @mock_item[model_index] ||= mock_model(model_class, stubs)
      @mock_item[model_index] = @mock_item[model_class.name].as_null_object if null_object
    end
  end
end
