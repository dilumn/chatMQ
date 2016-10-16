require "ffi-rzmq"

module ChatMQ
  class Client

    def initialize(address)
      start
    end

    def start
      context = ZMQ::Context.new(1)

      # Socket to talk to server
      requester = context.socket(ZMQ::REQ)
      requester.connect("tcp://localhost:5555")

      requester.send_string "Hello from Client"

      reply = ''
      rc = requester.recv_string(reply)

      puts "Received reply [#{reply}]"

    end

  end
end
