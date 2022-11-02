defmodule FlightBooking1 do
  alias FlightBooking1.Bookings.Agent, as: BookingAgent
  alias FlightBooking1.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking

  alias FlightBooking1.Users.Agent, as: UserAgent
  alias FlightBooking1.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents() do
    UserAgent.start_link(%{})
    BookingAgent.start_link()
  end

  defdelegate create_or_update_booking(params), to: CreateOrUpdateBooking, as: :call

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
end
