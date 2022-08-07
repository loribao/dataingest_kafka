defmodule Dataingest.Core.ChatMessage.ModelPayload do
  alias Dataingest.Core.ChatMessage.ModelUser

  defstruct id: "",
            text: "",
            available: nil,
            created_at: nil,
            user: %{}

  def build(%{
        "available" => available,
        "created_at" => created_at,
        "id" => id,
        "text" => text,
        "user" => user
      }) do
    %__MODULE__{
      id: id,
      available: available,
      created_at: created_at,
      text: text,
      user: ModelUser.build(user)
    }
  end

  def build({:ok, _}) do
    {:error, "nao implementado"}
  end

  def build({:error, _}) do
    {:error, "erro parse"}
  end
end
