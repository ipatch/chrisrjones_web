###
# Global configuration file for cap
###
# Per: http://capistranorb.com/documentation/getting-started/configuration/
###
lock "~> 3.10.1"

set :application,     'CrjCom'
set :repo_url,        'git@github.com:ipatch/crj.com.git'

set :rvm_ruby_version, '2.3.1'
set :default_env, { rvm_bin_path: "~/.rvm/bin"}
set :bundle_flags, '--deployment'
SSHKit.config.command_map[:rake] = "#{fetch(:default_env)[:rvm_bin_path]}/rvm ruby-#{fetch(:rvm_ruby_version)} do bundle exec rake"

# set the default location for the app will be deployed to
set :user, "deploy"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

### DEPRECATED
# set :scm, :git # The below setting has been deprecated!
# set :use_sudo, false <= no longer required `cap production deploy doctor`
# set :deploy_via,      :remote_cache
### END
set :branch,           'master'
set :keep_releases,   5
set :format,        :pretty
set :log_level,     :debug
set :stage,         :production
set :pty,             true

append :linked_files,  "config/secrets.yml"
# set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')

append :linked_dirs, "bin", "tmp", "vendor/bundle", "public/system" #, "#{release_path}.bundle"
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'tmp', 'vendor/bundle', 'public/system')

# Puma Settings
# set :puma_conf, "#{shared_path}/config/puma.rb"
# set :puma_conf,       "#{shared_path}/puma.rb"

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_role,       :app
set :puma_env,        fetch(:rack_env, fetch(:rails_env, 'production'))
# the below settings are / were working great 👌
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
###
# the below setting is not valid for cap v3, checked via running `cap deploy production doctor`
###
# set :puma_worker_timeout, nil
# END puma settings

###
# Nginx setup
###
set :nginx_domains, "chrisrjones.com"
# nginx service script
set :nginx_service_path, "/etc/init.d/nginx"

# Roles the deploy nginx site on,
# default value: :web
set :nginx_roles, :web

# Path, where nginx log file will be stored
# default value: "#{shared_path}/log"
set :nginx_log_path, "#{release_path}/log"

# Path where to look for static files
# default value: "public"

# Name of file stored in site-enabled/available
# default value: "#{fetch :application}"

# Path where nginx available site are stored
# default value: "/etc/nginx/sites-enabled"

# Path to look for custom config template
# `:default` will use the bundled nginx template
# default value: :default
set :nginx_template, "#{stage_config_path}/#{fetch :stage}/nginx.conf.erb"

# Whether you want to server an application through a proxy pass
# default value: true
set :app_server, true

# Socket file that nginx will use as upstream to serve the application
# Note: Socket upstream has priority over host:port upstreams
# no default value
set :app_server_socket, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"

# The host that nginx will use as upstream to server the application
# default value: 127.0.0.1
set :app_server_host, "127.0.0.1"

# The port the application server is running on
# no default value
set :app_server_port, 7777

###
# END - nginx settings
###

namespace :puma do
  
  before :start, :make_dirs
  
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end
end

namespace :deploy do
  before :starting,     :check_revision
  after 'puma:smart_restart', 'nginx:restart'
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup

  # desc "Set config/puma.rb for upstart"
  # task :puma_conf do
  #   on roles(:app) do
  #     execute "ln -sf #{shared_path}/puma.rb #{fetch(:deploy_to)}/current/config/puma.rb"
  #   end
  # end

  desc "Check that we can access everything"
  task :check_write_permissions do
    on roles(:all) do |host|
      if test("[ -w #{fetch(:deploy_to)} ]")
        info "#{fetch(:deploy_to)} is writable on #{host}"
      else
        error "#{fetch(:deploy_to)} is not writable on #{host}"
      end
    end
  end

  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Runs any rake task, cap deploy:rake task=db:rollback'
  task rake: [:set_rails_env] do
    on release_roles([:db]) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, ENV['task']
        end
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
    
    after :finishing,    :compile_assets
    after :finishing, "deploy:cleanup"
  end
end
