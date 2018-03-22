# Example repo that shows an issue with Ruby <-> Elixir GRPC communication

How to reproduce the issue:

#### 1. Start the Ruby server:

[source](ruby_server/app.rb)

``` bash
$ cd ruby_server
$ ruby app.rb
```

This will start a Hello World server on the `0.0.0.0:50051` host.

#### 2. Execute a call with the Elixir client:

[source](elixir_client/lib/mix/tasks/hello.ex)

``` bash
$ cd elixir_client
$ mix hello
```

With this example, I get the following output:

``` bash
{:error,
 %GRPC.RPCError{message: "shouldn't finish when getting headers", status: 13}}
{:error,
 %GRPC.RPCError{message: "shouldn't finish when getting headers", status: 13}}
{:error,
 %GRPC.RPCError{message: "shouldn't finish when getting headers", status: 13}}
{:error,
 %GRPC.RPCError{message: "shouldn't finish when getting headers", status: 13}}
{:error,
 %GRPC.RPCError{message: "shouldn't finish when getting headers", status: 13}}
{:error,
 %GRPC.RPCError{message: "shouldn't finish when getting headers", status: 13}}
{:error,
 %GRPC.RPCError{message: "shouldn't finish when getting headers", status: 13}}
```

## Additional clues

The issue seems to be related to timing of the response. If I remove the
`sleep 0.3` from the server implementation, everything seems to be working.
