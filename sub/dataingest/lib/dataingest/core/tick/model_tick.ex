defmodule Dataingest.Core.Tick.ModelTick do
  alias Dataingest.Core.Tick.ModelPayload

  defstruct id: "", payload: nil

  def build(data) when is_binary(data) do
    case String.match?(data, ~r/data.*crash.tick.*status/) == true do
      true ->
        data
        |> String.replace(~r/^[0-9]{1,}/, "")
        |> Jason.decode()
        |> build()

      false ->
        {:error, "nao é tick"}
    end
  end

  def build(
        {:ok,
         [
           _,
           %{
             "id" => id,
             "payload" => payload
           }
         ]}
      ) do
    {:ok,
     %__MODULE__{
       id: id,
       payload: ModelPayload.build(payload)
     }}
  end

  def build({:ok, _}) do
    {:error, "nao implementado"}
  end

  def build({:error, _}) do
    {:error, "erro parse"}
  end
end
