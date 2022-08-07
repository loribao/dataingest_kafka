defmodule Dataingest.Core.Tick.ModelTickTest do
  alias Dataingest.Core.Tick.ModelTick

  use ExUnit.Case, async: true
  doctest Dataingest

  setup_all do
    {:ok,
    raw_message_string_valid:
       "42[        \"data\",        {          \"id\": \"crash.tick\",          \"payload\": {            \"id\": \"8r22QWPJrb\",            \"updated_at\": \"2022-08-02T14:35:01.462Z\",            \"status\": \"graphing\",            \"crash_point\": \"null\"          }        }      ]",
       raw_message_string_no_valid:
       "42[      \"data\",      {        \"id\": \"crash.tick\",        \"payload\": {          \"id\": \"8r22QWPJrb\",          \"updated_at\": \"2022-08-02T14:35:01.462Z\",          \"statu\": \"graphing\",          \"crash_poin\": \"null\"        }      }    ]"}
  end

  describe "ModelTick build /1" do
    test "return {:ok, model: %ModelTick{...}}", state do
      {:ok, model} = ModelTick.build(state[:raw_message_string_valid])

      assert String.equivalent?(model.id, "crash.tick")
      assert String.equivalent?(model.payload.id, "8r22QWPJrb")
      assert String.equivalent?(model.payload.status, "graphing")
    end

    test "return {:error, _}", state do
      ret = ModelTick.build(state[:raw_message_string_no_valid])
      assert match?({:error, _}, ret)
    end
  end
end
