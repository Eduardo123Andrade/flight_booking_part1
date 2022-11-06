defmodule FlightBooking.Users.CreateOrUpdate do
  alias FlightBooking.Users
  alias Users.Agent, as: UserAgent
  alias Users.User

  def call(%User{cpf: cpf, email: email, name: name}) do
    name
    |> User.build(email, cpf)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)
    {:ok, "User created or updated successfully"}
  end
end
