require 'erb'
require 'yaml'

require 'capistrano'
require 'capistrano/ext/multistage'

# Helper Methods
# def template(from, to)
#   erb = File.read(File.expand_path("../recipes/templates/#{from}", __FILE__))
#   put ERB.new(erb, nil, '-').result(binding), to
# end

def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb, nil, '-').result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

def remote_file_exists?(full_path)
  'true' ==  capture("if [ -e #{full_path} ]; then echo 'true'; fi").strip
end

def run_interactively(command)
  exec %(ssh #{ ssh_cmd_prefix } -l #{ user } #{ deploy_server } -t "cd #{ deploy_to }/current && #{ bundle_cmd } exec #{ command }")
end
