class ApplicationService
  # TODO include CanCan::...

  # def initialize(current_user, params)

  #   @resource = ...
  # end

  protected

  # def validate_params!(params, required = {})

  # end

  # def authorize!(action)
  #   raise CanCan::AccessDenied unless can?(action, @resource)
  # end

  # def get_owner(params)
  #   extract_const = proc do |x|
  #     x.detect { |k| k =~ /([^_])(_id)/ }.
  #       split('_').delete_if { |x| x == 'id' }.join('_')
  #   end

  #   if (owner_class = extract_const.(params.keys))
  #     owner_class.classify.constantize.find(params["#{ owner_class }_id"])
  #   end
  # end

end