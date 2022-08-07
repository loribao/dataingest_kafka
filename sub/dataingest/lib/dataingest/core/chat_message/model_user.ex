defmodule Dataingest.Core.ChatMessage.ModelUser do
  defstruct id: "",
            username: "",
            label: "",
            level: "",
            rank: nil

  def build(%{
        "id" => id,
        "label" => label,
        "level" => level,
        "rank" => rank,
        "username" => username
      }) do
    %__MODULE__{
      id: id,
      label: label,
      level: level,
      rank: rank,
      username: username
    }
  end

  def build({:ok, _}) do
    {:error, "nao implementado"}
  end

  def build({:error, _}) do
    {:error, "erro parse"}
  end
end
