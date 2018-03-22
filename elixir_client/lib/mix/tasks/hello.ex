defmodule Mix.Tasks.Hello do
  use Mix.Task

  def run(_) do
    Application.ensure_all_started(:gun)
    Application.ensure_all_started(:grpc)

    {:ok, channel} = GRPC.Stub.connect("0.0.0.0:50051")

    (1 .. 100) |> Enum.each( fn(_) ->
      res = channel |> Hello.HelloService.Stub.hello(Hello.HelloReq.new(msg: "asdasds"))
      IO.inspect res
    end)
  end
end
