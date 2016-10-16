require "chatMQ/server"
require "chatMQ/client"

module ChatMQ
  class CLI

    def initialize(*)
      if ARGV.include? "start"
        start_server(ARGV[1])
      elsif ARGV.include? "connect"
        connect_server(ARGV[1])
      end
    end

    def start_server(address)
      server = ChatMQ::Server.new(address)
    end

    def connect_server(address)
      client = ChatMQ::Client.new(address)
    end

  end
end
