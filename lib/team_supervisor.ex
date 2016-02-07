defmodule Gameserver.TeamSupervisor do
  require Logger
  use Supervisor

  def start_link(state, opts \\ []) do
    Supervisor.start_link(__MODULE__, state, opts)
  end

  def init([]) do
    children = [
      worker(Gameserver.Team, [], restart: :transient)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end

  def new_team do
    Supervisor.start_child(__MODULE__, [[],[]])
  end
end
