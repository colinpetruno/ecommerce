# Resque.redis = "#{ENV["DB_PORT_5432_TCP_ADDR"]}:6379"
# currently host of the docker machine, not sure why the db is different
Resque.redis = "192.168.99.100:6379"
