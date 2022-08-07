defmodule Dataingest.Core.ChatMessage.ModelMessageTest do
  alias Dataingest.Core.ChatMessage.ModelMessage
  # alias Dataingest.Core.ChatMessage.ModelPayload
  # alias Dataingest.Core.ChatMessage.ModelUser

  use ExUnit.Case, async: true
  doctest Dataingest

  setup_all do
    {:ok,
     raw_message_string_no_valid:
       "42[\"data\",{\"id\":\"chat.message\",\"payload\":{\"id\":\"xrM3YoX9kQ\",\"tet\":\"MIN 08 RED🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️ POSSIVEL BRANCO SOMENTE 1G\",\"available\":true,\"created_at\":\"2022-08-02T10:08:19.348Z\",\"user\":{\"id\":\"qlPVP5Je1z\",\"username\":\"@WIN✅REI👑🔴👑🔴👑🔴\",\"label\":null,\"level\":58,\"rank\":\"gold\"}}}]",
     raw_message_string_valid:
       "42[\"data\",{\"id\":\"chat.message\",\"payload\":{\"id\":\"xrM3YoX9kQ\",\"text\":\"MIN 08 RED🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️🔴🈴️ POSSIVEL BRANCO SOMENTE 1G\",\"available\":true,\"created_at\":\"2022-08-02T10:08:19.348Z\",\"user\":{\"id\":\"qlPVP5Je1z\",\"username\":\"@WIN✅REI👑🔴👑🔴👑🔴\",\"label\":null,\"level\":58,\"rank\":\"gold\"}}}]"}
  end

  describe "ModelMessage build /1" do
    test "return {:ok, model: %ModelMessage{...}}", state do
      {:ok, model} = ModelMessage.build(state[:raw_message_string_valid])

      assert String.equivalent?(model.id, "chat.message")
      assert String.equivalent?(model.payload.id, "xrM3YoX9kQ")
      assert String.equivalent?(model.payload.user.id, "qlPVP5Je1z")
    end

    test "return {:error, _}", state do
      ret = ModelMessage.build(state[:raw_message_string_no_valid])
      assert match?({:error, _}, ret)
    end
  end
end
