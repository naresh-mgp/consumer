class AdvertisementsWorker
    include Sneakers::Worker
    from_queue "dashboard.advrts"
            #  :env => 'test',
            #  :durable => true,
            #  :ack => true
            #  :threads => 50,
            #  :prefetch => 50,
            #  :timeout_job_after => 1,
            #  :exchange => 'dummy',
            #  :heartbeat => 5
    
    # def work(raw_advertisement)
    #   puts "Hi naresh................................!!!!!!!!!!!!"
    #   # Advertisement.push(raw_advertisement)
    #   ack! 
    # end
    # from_queue "dashboard.advertisements"
             
    
    def work
      # puts "Hi naresh................................!!!!!!!!!!!!"
      Advertisement.push(raw_advertisement)
      ack! 
    end
  end