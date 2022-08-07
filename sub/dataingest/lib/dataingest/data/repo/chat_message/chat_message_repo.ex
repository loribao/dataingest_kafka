defmodule Dataingest.Repo.ChatMessage.ChatMessageRepo do
  alias Dataingest.Core.ChatMessage.ModelMessage

  def create(data) when is_list(data) do
    ret = Mongo.insert_many!(:mongo, :chatmessage, data)
    {:ok, ret}
  end

  def create(data) when is_struct(data, ModelMessage) do
    ret = Mongo.insert_one!(:mongo, :chatmessage, data)
    {:ok, ret}
  end
end
