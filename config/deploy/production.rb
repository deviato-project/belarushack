server 'belarus.deviato.co', user: 'deploy', roles: [:web, :app, :db], primary: true
set :stage, :production

set :rails_env, 'production'
