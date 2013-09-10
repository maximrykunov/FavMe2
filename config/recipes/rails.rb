require File.expand_path(File.dirname(__FILE__) + '/helpers')

Capistrano::Configuration.instance.load do
  namespace :rails do
    desc "Run rails console"
    task :console, roles: :app do
      # run "cd #{ deploy_to }/current && #{ bundle_cmd } exec rails console #{ stage }"
      run_interactively "rails console #{ rails_env }"
    end

    desc "Run rails dbconsole"
    task :dbconsole, roles: :db do
      # run "cd #{ deploy_to }/current && #{ bundle_cmd } exec rails dbconsole #{ stage }"
      run_interactively "rails dbconsole #{ rails_env }"
    end

    desc "Run rake command: cap rails:rake cmd='...'"
    task :rake do
      run "cd #{ deploy_to }/current && #{ bundle_cmd } exec rake #{ ENV['cmd'] } RAILS_ENV=#{ stage }"
    end

    desc "Run thor command: cap rails:thor cmd='...'"
    task :thor do
      run "cd #{ deploy_to }/current && #{ bundle_cmd } exec thor #{ ENV['cmd'] } RAILS_ENV=#{ stage }"
    end
  end
end

