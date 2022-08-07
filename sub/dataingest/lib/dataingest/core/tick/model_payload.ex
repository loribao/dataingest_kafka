defmodule Dataingest.Core.Tick.ModelPayload do
  defstruct id: "", updated_at: "", status: "", crash_point: nil

  def build(%{
        "crash_point" => crash_point,
        "id" => id,
        "status" => status,
        "updated_at" => updated_at
      }) do
    %__MODULE__{
      id: id,
      updated_at: updated_at,
      status: status,
      crash_point: crash_point
    }
  end

  def build({:ok, _}) do
    {:error, "nao implementado"}
  end

  def build({:error, _}) do
    {:error, "erro parse"}
  end
end
