require File.expand_path(File.dirname(__FILE__) + '/helpers')

Capistrano::Configuration.instance.load do
  after "deploy:setup",             "settings:setup"
  after "deploy:finalize_update",   "settings:create_symlink"

  namespace :settings do
    desc "Generate the <STAGE>.yml config file"
    task :setup, roles: :app do
      run "mkdir -p #{ shared_path }/config"
      template "settings.yml.erb", "#{ shared_path }/config/#{ stage }.yml"
    end

    desc "Symlink the <STAGE>.yml file into latest release"
    task :create_symlink, roles: :app do
      run "ln -nfs #{ shared_path }/config/#{ stage }.yml #{ release_path }/config/environments/#{ stage }.yml"
    end
  end
end
