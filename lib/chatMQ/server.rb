require "ffi-rzmq"

module ChatMQ
  class Server

    def initialize(address)
      start
    end

    def start
      context = ZMQ::Context.new(1)
      socket = context.socket(ZMQ::REP)
      socket.bind("tcp://*:5555")

      while true
        request = ''
        rc = socket.recv_string(request)

        puts "Received request. Data: #{request.inspect}"

        # Send reply back to client
        socket.send_string("TESTING 123")
      end
    end

  end
end
