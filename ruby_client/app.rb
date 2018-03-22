$:.unshift(".")

require "hello_pb"
require "hello_services_pb"

client = Hello::HelloService::Stub.new("0.0.0.0:50051", :this_channel_is_insecure)

puts client.hello(Hello::HelloReq.new(:msg => "Hi"))
