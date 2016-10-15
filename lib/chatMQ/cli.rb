require "chatMQ/server"

module ChatMQ
  class CLI

    def initialize(*)
      if ARGV.include? "start"
        start_server(ARGV[1])
      end
    end

    def start_server(address)
      server = ChatMQ::Server.new(address)
    end

  end
end
