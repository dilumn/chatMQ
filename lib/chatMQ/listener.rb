require "ffi-rzmq"

module ChatMQ
  class Listener

    def initialize(address)
      start
    end

    def start
      context = ZMQ::Context.new(1)

      subscriber = context.socket(ZMQ::SUB)
      subscriber.connect("tcp://localhost:5561")
      subscriber.setsockopt(ZMQ::SUBSCRIBE,"")

      while true
        subscriber.recv_string(string = '')
        p string
      end
    end

  end
end
