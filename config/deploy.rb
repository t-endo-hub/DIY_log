lock "~> 3.14.1"

set :application, "DIY_log"
set :repo_url, "git@github.com:t-endo-hub/DIY_log.git"

set :deploy_to, "/home/ec2-user/DIY_log"
set :rbenv_ruby, '2.5.7'
set :linked_files, %w{config/master.key .env}
append :linked_dirs, "log", "public", "tmp"
