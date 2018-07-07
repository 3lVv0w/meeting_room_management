# workers 2
# threads 4,16

# app_dir = File.expand_path("../..", __FILE__)

# rackup      DefaultRackup
# port        3000

# rails_env = ENV['RAILS_ENV'] || "development"
# environment rails_env


# if rails_env == "production"
#   daemonize true
#   pidfile "/home/ubuntu/production/shared/tmp/pids/puma.pid"
# end

# on_worker_boot do
#   # worker specific setup
#   require "active_record"
#   ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
#   ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
# end
