require "daimon_skycrawlers"
require "daimon_skycrawlers/logger"
require "daimon_skycrawlers/queue"

DaimonSkycrawlers.configure do |config|
  config.logger = DaimonSkycrawlers::Logger.default
  config.logger.level = ::Logger::DEBUG
  config.crawler_interval = 1
  config.shutdown_interval = 300
end

DaimonSkycrawlers::Queue.configure do |config|
  # queue configuration
  #amqp_uri = URI(ENV["CLOUDAMQP_URL"])
  amqp_uri = URI(ENV["RABBITMQ_BIGWIG_URL"])
  config.logger = DaimonSkycrawlers.configuration.logger
  config.host = amqp_uri.host
  # config.port = 5672
  config.port = amqp_uri.port
  config.username = amqp_uri.user
  config.password = amqp_uri.password
  # config.vhost = amqp_uri.user
  config.vhost = amqp_uri.path
  config.max_reconnect_attempts = 10
  config.network_recovery_interval = 1.0
end
