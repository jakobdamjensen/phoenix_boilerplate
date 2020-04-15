defmodule PhoenixBoilerplate.Factory do
  use ExMachina.Ecto, repo: PhoenixBoilerplate.Repo

  def user_factory do
    %PhoenixBoilerplate.Users.User{
      email: sequence(:email, &"email-#{&1}@example.com")
    }
  end
end
