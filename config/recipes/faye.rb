require File.expand_path(File.dirname(__FILE__) + '/helpers')

Capistrano::Configuration.instance.load do
  set_default(:faye_pid)     { "#{ shared_path }/pids/faye.pid" }
  set_default(:faye_config)     { "#{ deploy_to }/current/faye.ru" }

  after 'deploy:finalize_update', 'faye:stop'
  after 'deploy', 'faye:start'

  namespace :faye do
    desc "Start Faye"
    task :start do
      run "cd #{ deploy_to }/current && #{ bundle_cmd } exec rackup #{ faye_config } -s thin -E production -D --pid #{ faye_pid }"
    end

    desc "Stop Faye"
    task :stop do
      run "kill `cat #{ faye_pid }` || true"
    end
  end
end



# set :deploy_to,    "/home/#{user}/projects/#{application_path}"
# [08.08.13 18:42:25] Maxim (Optik): set :faye_start_cmd, "cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec rackup #{faye_conf} -s thin -E production -D --pid #{faye_pid}"
