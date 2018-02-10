###
# Global configuration file for cap
###
# Per: http://capistranorb.com/documentation/getting-started/configuration/
###
server '107.170.40.252', port: 4321, user: 'deploy', roles: %{web, :app, db}, primary: true

# The below setting has been deprecated!
###
# set :scm,             :git
### END

set :repo_url,        'git@github.com:ipatch/crj.com.git'
set :branch,           'master'
set :keep_releases,   5
set :format,        :pretty
set :log_level,     :debug
set :application,     'CrjCom'
set :user,            'deploy'

# Don't change these unless you know what you're doing
set :pty,             true
# set :use_sudo,        false <= no longer required `cap production deploy doctor`
set :stage,           :production
###
# the below setting is not valid for cap v3, checked via running `cap deploy production doctor`
###
# set :deploy_via,      :remote_cache
### END

# if 'test -f "config/secrets.yml"'
  # do nothing
# else
  # append :linked_files,  "config/secrets.yml"
  set :linked_files, fetch(:linked_files, []).push('config/secrets.yml', 'config/puma.rb')
# end

# if 'test -f "public/404.html"'
  # do nothing
# else
  # append linked_dirs, "bin", "log", "tmp" "vendor/bundle" "public/system"
  set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp', 'vendor/bundle', 'public/system')
# end

# Puma Settings
set :puma_conf, "#{current_path}/config/puma.rb"

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
# set :puma_conf,       "#{shared_path}/puma.rb"
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
###
# the below setting is not valid for cap v3, checked via running `cap deploy production doctor`
###
# set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
# END puma settings

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  before :starting,     :check_revision
  # before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma_config'
  # before 'check:linked_files', 'puma:nginx_confg'
  after 'puma:smart_restart', 'nginx:restart'
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup

  desc "Set config/puma.rb for upstart"
  task :puma_conf do
    on roles(:app) do
      execute "ln -s #{shared_path}/puma.rb #{fetch(:deploy_to)}/current/config/puma.rb"
    end
  end

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

    after :finishing, "deploy:cleanup"
  end
end
