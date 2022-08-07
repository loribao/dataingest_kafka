defmodule Dataingest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Dataingest.Data.Consumers.Framereceived, []},
      {Mongo, [[name: :mongo, url: "mongodb://localhost:27017/messages"]]}
    ]

    opts = [strategy: :one_for_one, name: Dataingest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
