require "ffi-rzmq"

module ChatMQ
  class Client

    def initialize(address)
      start
    end

    def start
      context = ZMQ::Context.new(1)

      synclient = context.socket(ZMQ::REQ)
      synclient.connect("tcp://localhost:5562")

      while true
        input = STDIN.gets.chomp
        synclient.send_string(input)

        # - wait for synchronization reply
        synclient.recv_string('')
      end
    end

  end
end
