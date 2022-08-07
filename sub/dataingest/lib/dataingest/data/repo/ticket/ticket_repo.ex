defmodule Dataingest.Data.Repo.Ticket.TicketRepo do
  alias Dataingest.Core.Tick.ModelTick

  def create(data) when is_list(data), do: Mongo.insert_many!(:mongo, :tick, data)

  def create(data) when is_struct(data, ModelTick), do: Mongo.insert_one!(:mongo, :tick, data)
end
