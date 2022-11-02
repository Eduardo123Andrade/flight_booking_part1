defmodule FlightBooking1.Bookings.Booking do
  @keys [:local_origin, :local_destination, :user_id, :id, :complete_date]
  @enforce_keys [:local_origin, :local_destination, :user_id, :complete_date]

  defstruct @keys

  def build(user_id, local_origin, local_destination, complete_date) do
    uuid = UUID.uuid4()

    {:ok,
     %__MODULE__{
       id: uuid,
       complete_date: complete_date,
       local_origin: local_origin,
       local_destination: local_destination,
       user_id: user_id
     }}
  end
end
