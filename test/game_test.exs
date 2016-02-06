defmodule Gameserver.GameTest do
  use ExUnit.Case, async: true
  alias Gameserver.Game

  setup do
    {:ok, game} = Game.start_link
    {:ok, game: game}
  end

  test "can be started", %{game: game} do
    assert Game.add_player(game, "keith") == :ok
  end
end
