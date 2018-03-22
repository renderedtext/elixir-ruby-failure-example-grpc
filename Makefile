.PHONY: pb.gen

pb.gen:
	grpc_tools_ruby_protoc --ruby_out=ruby_server/ --grpc_out=ruby_server/ hello.proto
	grpc_tools_ruby_protoc --ruby_out=ruby_client/ --grpc_out=ruby_client/ hello.proto
	protoc --elixir_out=plugins=grpc:elixir_client/lib/ --plugin=`echo ~/.mix/escripts/protoc-gen-elixir` hello.proto
