require "ffi-rzmq"

module ChatMQ
  class Server

    def initialize(address)
      start
    end

    def start
      context = ZMQ::Context.new(1)

      publisher = context.socket(ZMQ::PUB)
      publisher.setsockopt(ZMQ::SNDHWM, 0);
      publisher.bind("tcp://*:5561")

      # Socket to receive signals
      syncservice = context.socket(ZMQ::REP)
      syncservice.bind("tcp://*:5562")

      while true
        string = ""
        syncservice.recv_string(string)

        # send synchronization reply
        syncservice.send_string("")

        publisher.send_string(string)
      end
    end

  end
end
