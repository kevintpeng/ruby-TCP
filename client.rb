require "socket"
class Client
  def initialize(server)
    @server = server
    @request = nil
    @response = nil
    # send
    # listen
  end
  #
  # def send
  #   @request = Thread.new do
  #     loop{
  #       # IO object from console input
  #       msg = $stdin.gets.chomp
  #       @server.puts( msg )
  #     }
  #   end
  # end
  #
  # def listen
  #   @response = Thread.new do
  #     loop{
  #       msg = @server.gets.chomp
  #       puts msg
  #     }
  #   end
  # end
end

server = TCPSocket.open("localhost", 3000)
Client.new(server)
