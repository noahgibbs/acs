require "redis"

class RedisPub
  def self.mutex
    @mutex ||= Mutex.new  # create it once
  end

  mutex  # Initialize

  def self.connection
    mutex.synchronize do
      @connection ||= Redis.new
    end
  end

  def self.connected?
    conn = self.connection

    mutex.synchronize do
      return @is_connected if @checked_connected

      @checked_connected = true
      begin
        @is_connected = true
        @connection.publish("none", "none")
      rescue Redis::CannotConnectError
      end
    end
  end

  def self.publish(channel, message)
    connection.publish(channel, message)
  end

end
