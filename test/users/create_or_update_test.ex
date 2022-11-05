defmodule FlightBooking1.Users.CreateOrUpdateTest do
  use ExUnit.Case

  import FlightBooking1.Factory

  alias FlightBooking1.Users.CreateOrUpdate
  alias FlightBooking1.Users.Agent, as: UserAgent

  describe "call/1" do
    test "when all params are valid, save the user" do
      UserAgent.start_link(%{})

      response =
        :user
        |> build
        |> CreateOrUpdate.call()

      expected_response = {:ok, "User created or updated successfully"}

      assert expected_response == response
    end
  end
end
