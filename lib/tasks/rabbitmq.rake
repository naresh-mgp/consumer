require 'sneakers/tasks'
namespace :rabbitmq do
    desc "Connect consumer to producer"
    task :rabbitmqsetup => :environment do
      require "bunny"
      conn = Bunny.new(
  
          :host      => "127.0.0.1",
          :port      => 5672,
          :ssl       => false,
          :vhost     => "/",
          :user      => "guest",
          :pass      => "guest",
          :heartbeat => :server, # will use RabbitMQ setting
          :frame_max => 131072,
          :auth_mechanism => "PLAIN"
  # :logger => Rails.logger,
  # :log_level => Logger::WARN
  
      ).tap(&:start)
      ch = conn.create_channel
      queue_advertisements = ch.queue("dashboard.advrts")
      # bind queue to exchange
      queue_advertisements.bind("prod.advrts")
      conn.close
      # p "Hi naresh"
    end
  end