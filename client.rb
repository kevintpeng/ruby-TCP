require "socket"
class Client
  def initialize(server)
    @server = server
    @request = nil
    @response = nil
    send
    listen
    @request.join
    @response.join
  end

  def send
    puts "Client: Input a username"
    @request = Thread.new do
      loop do
        "asdf"
        @server.puts $stdin.gets.chomp
      end
    end
  end

  def listen
    @response = Thread.new do
      loop do
        puts @server.gets.chomp
      end
    end
  end
end

server = TCPSocket.open("localhost", 3000)
c = Client.new(server)
