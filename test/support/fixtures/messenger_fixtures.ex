defmodule LiveviewTest.MessengerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveviewTest.Messenger` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        author: "some author",
        message: "some message"
      })
      |> LiveviewTest.Messenger.create_message()

    message
  end
end
