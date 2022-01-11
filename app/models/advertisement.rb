class Advertisement
  KEY = "advertisement"
  STORE_LIMIT = 10
  def self.list(limit = STORE_LIMIT)
    $redis.lrange(KEY, 0, limit).map do |raw_advertisement|
      JSON.parse(raw_advertisement)
    end
  end
  def self.push(raw_advertisement)
      datas = JSON.parse(raw_advertisement)
      broadcast_datas(datas)
    $redis.lpush(KEY, raw_advertisement)
    $redis.ltrim(KEY, 0, STORE_LIMIT-1)
  end

  private
  
  def self.broadcast_datas(datas)
    puts "Hi naresh...... #{datas.inspect}"
    ActionCable.server.broadcast 'datas',
        name: datas['name']
  end
end