# setup Rails generators
Rails.application.config.generators do |g|
  g.view_specs false
  g.helper_specs false
  g.controller_specs false
  g.routing_specs false
  g.request_specs false
  g.decorator_specs false # does it work?

  g.helper false
  g.assets false
  g.decorator false # does it work?
end
