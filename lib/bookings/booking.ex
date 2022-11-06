defmodule FlightBooking1.Bookings.Booking do
  @keys [:local_origin, :local_destination, :user_id, :id, :complete_date]
  @enforce_keys [:local_origin, :local_destination, :user_id, :complete_date]

  defstruct @keys

  def build(user_id, local_origin, local_destination, complete_date) do
    uuid = UUID.uuid4()
    local_date = NaiveDateTime.local_now()

    compare = NaiveDateTime.compare(complete_date, local_date)

    create_booking(uuid, user_id, local_origin, local_destination, complete_date, compare)
  end

  defp create_booking(id, user_id, local_origin, local_destination, complete_date, compare)
       when compare == :gt do
    {:ok,
     %__MODULE__{
       id: id,
       complete_date: complete_date,
       local_origin: local_origin,
       local_destination: local_destination,
       user_id: user_id
     }}
  end

  defp create_booking(_id, _user_id, _local_origin, _local_destination, _complete_date, _compare) do
    {:error, "Invalid date"}
  end
end
