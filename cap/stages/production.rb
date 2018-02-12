###
# Stage specific configuration file for crj.com
###
# Per: http://capistranorb.com/documentation/getting-started/configuration/

server '107.170.40.252', port: 4321, user: 'deploy', roles: %w{web app db}, primary: true

set :ssh_options, {
  keys: %w(/home/deploy/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'deploy',
}

set :rails_env, :production
set :conditionally_migrate, true
