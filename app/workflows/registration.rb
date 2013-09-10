class Registration < App::Workflow
  # Monad main method.
  def self.unit(value = User.new)
    super(value)
  end

  # Scenario methods.
  # Everyone should return value (User instance) to evaluate or Failure to end
  # the execution of 'may'. If a method returns 'false' or 'nil', the execution
  # will continue.
  def set_user(params)
    User.where(params).first_or_initialize
  end

  def signup
    fetch.new_record? ? fast_registration(fetch) : false
  end

  def refresh_token
    fetch.new_record? ? false : refresh_authentication_token!(fetch)
  end

protected

  def fast_registration(user)
    # user.without_password = true
    confirm(user)

    Either(user.save).>= {
      Either(Devise.mailer.respond_to?(:fast_registration_instructions)).
        >= { Devise.mailer.fast_registration_instructions(value).deliver }.
        >= { user }.or { rollback_registration(user) }
    }.
    >= { user }
  end

private

  def confirm(user)
    user.confirmation_token = user.unconfirmed_email = nil
    user.confirmed_at = Time.now.utc
  end

  def rollback_registration(user)
    user.destroy
    fail_like_unavailable
  end
end

