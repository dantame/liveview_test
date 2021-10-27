defmodule LiveviewTest.MessengerTest do
  use LiveviewTest.DataCase

  alias LiveviewTest.Messenger

  describe "messages" do
    alias LiveviewTest.Messenger.Message

    import LiveviewTest.MessengerFixtures

    @invalid_attrs %{author: nil, message: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messenger.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messenger.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{author: "some author", message: "some message"}

      assert {:ok, %Message{} = message} = Messenger.create_message(valid_attrs)
      assert message.author == "some author"
      assert message.message == "some message"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messenger.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{author: "some updated author", message: "some updated message"}

      assert {:ok, %Message{} = message} = Messenger.update_message(message, update_attrs)
      assert message.author == "some updated author"
      assert message.message == "some updated message"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messenger.update_message(message, @invalid_attrs)
      assert message == Messenger.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messenger.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messenger.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messenger.change_message(message)
    end
  end
end
