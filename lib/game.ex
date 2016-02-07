defmodule Gameserver.Game do
  use GenServer
  require Logger

  # Client

  @doc """
  Starts the process
  """
  def start_link(state, opts \\ []) do
    GenServer.start_link(__MODULE__, state, opts)
  end

  @doc """
  Ensures there is a player associated with the given `name` in `server`.
  """
  def add_player(pid, name) do
    GenServer.cast(pid, {:add_player, name})
  end

  @doc """
  Adds a new team to the game.
  """
  def add_team(pid, name) do
    GenServer.cast(pid, {:add_team, name})
  end

  # Server (callbacks)

  def init(state) do

    import Supervisor.Spec, warn: false

    children = [
      supervisor(Gameserver.TeamSupervisor,
      [[],[]]),
    ]
    {:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)

    {:ok, state}
  end

  def handle_cast({:add_player, name}, state) do
    # noop
    {:noreply, [name | state]}
  end

  def handle_cast({:add_team, name}, state) do
    # GenServer.call(:sup_team, [:add_team, name])
    {:noreply, [name | state]}
  end
end
