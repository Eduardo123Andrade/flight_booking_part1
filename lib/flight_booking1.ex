defmodule FlightBooking1 do
  alias FlightBooking1.Users.Agent, as: UserAgent
  alias FlightBooking1.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents() do
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
end
