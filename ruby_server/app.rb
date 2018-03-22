$:.unshift(".")

require "hello_pb"
require "hello_services_pb"

class Server < Hello::HelloService::Service
  def hello(req, _)
    p req

    sleep 0.3

    Hello::HelloRes.new(:msg => "hi")
  end
end

address = "0.0.0.0:50051"
server = GRPC::RpcServer.new
server.add_http2_port(address, :this_port_is_insecure)

puts "Started GRPC server on #{address}."

server.handle(Server)
server.run_till_terminated
