class AdvertisementsWorker
    include Sneakers::Worker
    from_queue "examplequeue4",
               :durable => true
            #  :env => 'test',
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
             
    
    def work(raw_advertisement)
      Advertisement.push(raw_advertisement)
      # puts "Hi naresh................................!!!!!!!!!!!! #{raw_advertisement.inspect}"
      # ack! 
    end
  end