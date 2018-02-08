###
# Global configuration file for cap
###
# Per: http://capistranorb.com/documentation/getting-started/configuration/

# Change these
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
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
# files we want symlinking to specific entries in shared.

# append :linked_files,    %w{config/secrets.yml}
remove :linked_files,   "config/secrets.yml"
append :linked_files,  "config/secrets.yml"
# set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')

remove :linked_dirs,     "bin", "log", "tmp" "vendor/bundle" "public/system"
append :linked_dirs,     "bin", "log", "tmp" "vendor/bundle" "public/system"
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp', 'vendor/bundle', 'public/system')

# Puma Settings
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_conf,       "#{shared_path}/puma.rb"
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
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
# END puma settings

# preserve paperclip attachments through deployments
# set :linked_dirs, fetch(:linked_dirs, []).push('public/system')


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

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  # desc 'copy linked files'
  # task :copy_config do
  #   on release_roles :app do |role|
  #     fetch(:linked_files).each do |linked_file|
  #       user = role.user + "@" if role.user
  #       hostname = role.hostname
  #       linked_files(shared_path).each do |file|
  #         run_locally do
  #           execute :rsync, "-rvz -e 'ssh -p 4321'", "config/#{file.to_s.gsub(/.*\/(.*)$/,"\\1")}", "#{user}#{hostname}:#{file.to_s.gsub(/(.*)\/[^\/]*$/, "\\1")}/"
  #         end
  #       end
  #     end
  #   end
  # end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end

    after :finishing, "deploy:cleanup"
  end

  # desc "link shared config files"
  # task :link_shared_secrets_config do
  #   run "test -f #{shared_path}/configs/secrets.yml && ln -sf #{shared_path}/configs/secrets.yml #{current_path}/config/database.yml ||
  #   echo 'no database.yml in shared/configs'"
  # end

  # task :update_git_repo do
  #   on release_roles :all do
  #     with fetch(:git_environmental_variables) do
  #       within repo_path do
  #         current_repo_url = execute :git, :config, :'--get', :'remote.origin.url'
  #         unless repo_url == current_repo_url
  #           execute :git, :remote, :'set-url', 'origin', repo_url
  #           execute :git, :remote, :update

  #           execute :git, :config, :'--get', :'remote.origin.url'
  #         end
  #       end
  #     end
  #   end
  # end
  # before 'deploy:check:linked_files', 'deploy:copy_config'
  # before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:config'
  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  # after  :finishing,    :restart

  # def remote_file_exists?(path)
  #   results = []
  
  #   invoke_command("if [ -e '#{path}' ]; then echo -n 'true'; fi") do |ch, stream, out|
  #     results << (out == 'true')
  #   end
  
  #   results.all?
  # end
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
