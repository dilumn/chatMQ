require "ffi-rzmq"

module ChatMQ
  class Client

    def initialize(address)
      start
    end

    def start
      context = ZMQ::Context.new(1)

      subscriber = context.socket(ZMQ::SUB)
      subscriber.connect("tcp://localhost:5561")
      subscriber.setsockopt(ZMQ::SUBSCRIBE,"")

      # 0MQ is so fast, we need to wait a while...
      sleep(1)

      synclient = context.socket(ZMQ::REQ)
      synclient.connect("tcp://localhost:5562")

      while true
        input = STDIN.gets.chomp
        synclient.send_string(input)

        # - wait for synchronization reply
        synclient.recv_string('')

        subscriber.recv_string(string = '')
        p string
      end
    end

  end
end
