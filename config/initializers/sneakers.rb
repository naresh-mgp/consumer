require 'sneakers'


Sneakers.configure  :heartbeat => 10,
  :amqp => 'amqp://guest:guest@localhost:5672',
  :vhost => '/',
  :exchange => 'prod.advrts',
  :exchange_type => :fanout,
  # :timeout_job_after => 5,      # Maximal seconds to wait for job
  # :prefetch => 10,              # Grab 10 jobs together. Better speed.
  # :threads => 10,               # Threadpool size (good to match prefetch)
  # :env => ENV['RACK_ENV'],      # Environment
  # # Must we acknowledge?
  # :heartbeat => 2,              # Keep a good connection with broker
  :durable => true
  # :hooks => {},                  # before_fork/after_fork hooks
  # :start_worker_delay => 10 
  
  # Sneakers.configure  :heartbeat => 30,
  #                     :amqp => 'amqp://guest:guest@localhost:5672',
  #                     :vhost => '/',
  #                     :exchange => 'sneakers',
  #                     :exchange_type => :direct
  #                     # more configuration options...
  
  Sneakers.logger = Rails.logger
  Sneakers.logger.level = Logger::INFO