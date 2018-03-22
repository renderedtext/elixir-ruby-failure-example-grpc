defmodule Hello.HelloReq do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    msg: String.t
  }
  defstruct [:msg]

  field :msg, 1, type: :string
end

defmodule Hello.HelloRes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    msg: String.t
  }
  defstruct [:msg]

  field :msg, 1, type: :string
end

defmodule Hello.HelloService.Service do
  @moduledoc false
  use GRPC.Service, name: "hello.HelloService"

  rpc :Hello, Hello.HelloReq, Hello.HelloRes
end

defmodule Hello.HelloService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Hello.HelloService.Service
end

