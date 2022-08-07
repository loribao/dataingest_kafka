defmodule Dataingest.Data.Consumers.Framereceived do
  use Broadway
  alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      context: %{},
      producer: [
        module:
          {BroadwayKafka.Producer,
           [
             hosts: [localhost: 9092],
             group_id: "ingest_1",
             topics: ["framereceived"]
           ]},
        concurrency: 1
      ],
      processors: [
        default: [
          concurrency: 10
        ]
      ],
      batchers: [
        default: [
          batch_size: 100,
          batch_timeout: 200,
          concurrency: 10
        ]
      ]
    )
  end

  @impl true
  def handle_message(_, %Message{data: data, metadata: meta} = message, _ctx) do
    %{
      headers: [{"url", _}, {"ts", _}],
      key: key,
      offset: _,
      partition: _,
      topic: _,
      ts: _
    } = meta

    ret_message =
      case String.match?(key, ~r/api.v2/) && String.match?(data, ~r/[data]/) do
        true ->
          message
          |> Message.update_data(fn _ -> String.replace(data, ~r/^([0-9]+)/, "") end)

        false ->
          message
          |> Message.failed({:error, "no api-v2"})
          |> Message.put_batcher(:errors)
      end
      ret_message
  end

  @impl true
  def handle_batch(:default, messages, _, _) do
    messages |> Enum.map(fn e -> e.data end)
  end

  @impl true
  def handle_batch(:errors, _messages, _, _) do
  end

  @impl true
  def handle_failed(messages, _context) do
    messages
  end
end

# server = Dataingest.Data.Consumers.Framereceived.start_link()
