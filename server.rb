require "socket"
class Server
  def initialize(port, ip)
    @server = TCPServer.open(ip, port)
    @connections = {}
    @connections[:client] = {}
    @name = "Kevin's Server"
    run
  end

  def run
    loop do
      p "starting loop"
      Thread.start(@server.accept) do |client|
        puts "New attempted connection from: #{client}"
        username = client.gets.chomp.to_sym
        puts "recieving username #{username}"
        @connections[:client].each do |other_name, other_client|
          if username == other_name || client == other_client
            puts "Killing thread for #{client}"
            client.puts "Username exists already. Please input a new name."
            Thread.kill self
          end
        end
        puts "adding user: #{username}"
        @connections[:client][username] = client
        client.puts "Connection established. Welcome #{username}."
        listen_user username, client
        puts "ending connection with #{username}"
        @connections[:client].delete username
        client.puts "Disconnecting from server."
      end
    end

    def listen_user(username, client)
      loop do
        msg = client.gets.chomp
        @connections[:client].each do |othername, otherclient|
          unless username == othername
            puts "sending message"
            otherclient.puts "#{username}: #{msg}"
          end
        end
      end
    end
  end
end

server = Server.new(3000, "localhost")
