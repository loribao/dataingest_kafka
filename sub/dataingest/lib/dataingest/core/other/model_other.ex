defmodule Dataingest.Core.Other.ModelOther do
  defstruct key: "", payload: nil

  def build(key, data) when is_binary(key) do
    %__MODULE__{
      key: key,
      payload: data
    }
  end
end
