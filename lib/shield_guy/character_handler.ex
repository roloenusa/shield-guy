defmodule ShieldGuy.CharacterHandler do
  require Record
  require Logger

  @moduledoc """
  A genserver to schedule a player into a pvp pool once the shield runs out. The process maintains on a node per node
  basis a list of available members to the pool, and collects all users into sets by time. The server then schedules itself
  to run at set intervals via `send_after/3`
  """
  use GenServer

  Record.defrecordp :worker_state, [
                                     character: nil
                                   ]

  def start() do
    :gen_server.start(__MODULE__, [], [])
  end

  @doc """
  Starts a dispatcher linked to the calling process application supervisor
  """
  # @spec start_link(term) :: {:ok, pid}
  def start_link(args) do
    :gen_server.start_link(__MODULE__, args, [])
  end

  #####
  # Interface
  #####

  def get_state(pid) do
    :gen_server.call(pid, :get_state)
  end

  def update(pid, attributes) do
    :gen_server.cast(pid, {:update_character, attributes})
  end

  #####
  # GenServer Implementation
  #####

  def init({name}) do
    ShieldGuy.Character.find_by_name(name)
    |> load_character
  end

  def load_character(nil), do: {:stop, :invalid}
  def load_character(char) do
    worker_state = worker_state(character: char)
    {:ok, worker_state}
  end

  def handle_call(:get_state, _from, worker_state) do
    {:reply, worker_state, worker_state}
  end

  def handle_cast({:update_character, attributes}, worker_state) do
    worker_state = do_update_character(worker_state, attributes)
    {:noreply, worker_state}
  end

  ####
  # Private Helpers
  ####

  def do_update_character(worker_state(character: char) = worker_state, attributes) do
    res = ShieldGuy.Character.update(char, attributes)
    case res do
      {:ok, char} -> worker_state(character: char)
      {_}         -> worker_state
    end
  end
end
