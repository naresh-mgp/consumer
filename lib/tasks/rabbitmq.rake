require 'sneakers/tasks'
namespace :rabbitmq do
    desc "Connect consumer to producer"
    task :rabbitmqsetup => :environment do
      require "bunny"
      conn = Bunny.new.start
      ch = conn.create_channel
      queue_advertisements = ch.queue("examplequeue4", :durable => true)
      # bind queue to exchange
      unless conn.exchange_exists?("example.exchange4")
        x = ch.fanout("example.exchange4", :durable => true)
      end
      queue_advertisements.bind("example.exchange4")
      # conn.close
      # p "Hi naresh"
    end
  end