defmodule Gameserver.GameSupervisor do
  require Logger
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    children = [
      worker(Gameserver.Game, [], restart: :transient)
    ]
    supervise(children, strategy: :simple_one_for_one)
	end

  @doc """
  Creates a new child process for the given `name`, or returns
  the pid for the existing process with that `name`.
  """
  def new_game(name) do
    case Supervisor.start_child(__MODULE__, [[],[name: name]]) do
      {:ok, pid} -> pid
      {:error, {:already_started, pid}} -> pid
      # res -> res
    end
  end
end
