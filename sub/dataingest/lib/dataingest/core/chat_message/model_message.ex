defmodule Dataingest.Core.ChatMessage.ModelMessage do
  alias Dataingest.Core.ChatMessage.ModelPayload

  defstruct id: "message", payload: nil
  # @type t :: %__MODULE__{id: String.t(), payload: %ModelPayload.__struct__}

  def build(data) when is_binary(data) do
    case String.match?(data, ~r/data.*chat.message.*text/) == true do
      true ->
        data
        |> String.replace(~r/^[0-9]{1,}/, "")
        |> Jason.decode()
        |> build()

      false ->
        {:error, "nao é msg"}
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
