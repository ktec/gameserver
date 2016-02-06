defmodule Gameserver.Game do
  use GenServer
  require Logger

  # Client

  @doc """
  Starts the process
  """
  def start_link() do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  # @doc """
  # Adds a player to the game
  #
  # Returns `{:ok, pid}` if the game exists, `:error` otherwise.
  # """
  # def lookup_player(pid, name) do
  #   GenServer.call(pid, {:lookup_player, name})
  # end

  @doc """
  Ensures there is a player associated with the given `name` in `server`.
  """
  def add_player(pid, name) do
    GenServer.cast(pid, {:add_player, name})
  end

  # Server (callbacks)

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:add_player, name}, state) do
    # noop
    {:ok, state}
  end
end
