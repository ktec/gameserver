defmodule Gameserver.Player do
  use GenServer

  # Client

  @doc """
  Starts the process
  """
  def start_link(state, opts) do
    GenServer.start_link(__MODULE__, state, opts)
  end

  # Server (callbacks)

  def init(state) do
    {:ok, state}
  end
end
