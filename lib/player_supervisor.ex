defmodule Gameserver.PlayerSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    children = [
      worker(Gameserver.Player, [], restart: :transient)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end

  def new_player do
    Supervisor.start_child(__MODULE__, [[],[]])
  end
end
