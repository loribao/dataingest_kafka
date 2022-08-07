defmodule Dataingest.Service.CoreEntryBuild do
  alias Dataingest.Core.Other.ModelOther

  def data_build(%{key: key, data: data}) do
    case String.match?(key, ~r/api.v2/) && String.match?(data, ~r/[data]/) do
      true -> true
      false -> ModelOther.build(key, data)
    end
  end
end
