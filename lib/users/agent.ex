defmodule FlightBooking1.Users.Agent do
  alias FlightBooking1.Users.User

  def start_link(_initial_state \\ %{}) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user), do: Agent.update(__MODULE__, &update_state(&1, user))

  def get(user_id), do: Agent.get(__MODULE__, &get_user(&1, user_id))

  def get_all(), do: Agent.get(__MODULE__, fn user -> user end)

  defp update_state(initial_state, %User{cpf: cpf} = user) do
    Map.put(initial_state, cpf, user)
  end

  defp get_user(state, user_id) do
    case(Map.get(state, user_id)) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
