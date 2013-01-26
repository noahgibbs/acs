class GameController < ApplicationController
  before_filter :set_up_sse

  # TODO: parameters, everything else
  def index
    self.response_body = Enumerator.new do |y|
      begin
        loop do
          y << sse_object({ :time => Time.now})
          STDERR.puts "(output SSE obj)"
          sleep 1
        end
      rescue IOError  # Necessary?
        # When the client disconnects, we'll get an IOError on write
      end
    end
  end

  protected

  def set_up_sse
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Last-Modified'] = Time.now.to_s
    headers['Cache-Control'] = 'no-cache'
  end

  def sse_object(obj, options = {})
    options.map { |k,v| "#{k}: #{v}" }.join("\n") +
      "data: " + MultiJson.dump(obj) + "\n\n"
  end


end
