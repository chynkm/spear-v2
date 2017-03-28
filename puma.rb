root = '/Users/karthikm/www/spear-ver2'

bind "unix://#{root}/tmp/puma/socket"
pidfile "#{root}/tmp/puma/pid"
state_path "#{root}/tmp/puma/state"
rackup "#{root}/config.ru"
environment 'development'
daemonize true

threads 4, 8

# to restart puma process
# pumactl -P tmp/puma/pid restart
