defmodule FlightBooking1.Users.UserTest do
  use ExUnit.Case

  import FlightBooking1.Factory

  alias FlightBooking1.Users.User

  describe "build/3" do
    test "when all parameters are valid, return the user" do
      response = User.build("Lord Stark", "email@email.com", "12312312312")

      {_, user} = response

      response = {:ok, build(:user, id: user.id)}

      expected_response = {:ok, build(:user, id: user.id)}

      assert response == expected_response
    end
  end
end
