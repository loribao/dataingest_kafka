defmodule Dataingest.Data.Repo.Other.OtherRepo do
  alias Dataingest.Core.Other.ModelOther
  def create(data) when is_list(data) do
    ret = Mongo.insert_many!(:mongo, :chatmessage, data)
    {:ok, ret}
  end

  def create(data) when is_struct(data, ModelOther) do
    ret = Mongo.insert_one!(:mongo, :other, data)
    {:ok, ret}
  end
end
