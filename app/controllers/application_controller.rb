class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_filter :set_locale

  # layout :resolve_layout

  def default_url_options
    native = r18n.locale.code == Settings.i18n.native_locale || Rails.env.test?
    { locale: native ? nil : r18n.locale.code }
  end

  def params_for
    @params_for ||= PermitParams.new(params, current_user)
  end

  def document(klass, as: nil, &block)
    App::DocumentItem::Base.assign(klass.unit, self, as, &block)
  end

protected

  def set_locale
    params[:locale] ||= 'ru'
    # session[:prev_locale] ||= params[:locale]

    # if session[:prev_locale] != params[:locale]
    #   # R18n.get.try(:reload!)
    #   # R18n.clear_cache!
    #   # R18n::Rails::Filters.reload!
    #   DataMapper::Validations::I18n.localize! params[:locale]
    # end
  end

  def resolve_layout
    # if (controller_name == 'web_documents' && action_name == 'home')
    #   return 'application'
    # end
    # 'inner'
  end

  def respond_with_errors(errors = nil)
    render json: {errors: errors}, status: :bad_request
  end
end
