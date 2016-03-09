require "socket"
class Server
  def initialize(port, ip)
    @server = TCPServer.open(ip, port)
    @connections = {}
    @name = "Kevin's Server"
    run
  end

  def run
    loop do
      Thread.start(@server.accept) do |client|
        puts client.gets.chomp
        client.puts "recieved"
      end
    end
  end
  # def run
  #   loop
  #     Thread.start(@server.accept) do |client|
  #       nickname = client.gets.chomp.to_sym
  #       @connections[:client].each do |othername, otherclient|
  #         if nickname == othername || client == otherclient
  #           client.puts "Username exists"
  #           Thread.kill self
  #         end
  #       end
  #       puts "#{nickname} #{client}"
  #       @connections[:client][:nickname] = client
  #       client.puts "Connection established."
  #       listen_user_message(username, client)
  #     end
  #   }
  # end
  #
  # def listen_user_message(username, client)
  #   loop{
  #     msg = client.gets.chomp
  #     @connections[:client].each do |othername, otherclient|
  #       unless username == othername
  #         otherclient.puts "#{username}: #{msg}"
  #       end
  #     end
  #   }
  # end
end

server = Server.new(3000, "localhost")
