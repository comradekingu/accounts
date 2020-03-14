defmodule Accounts.Factory do
  @moduledoc """
  This module provides database factories for testing.
  """

  use ExMachina.Ecto, repo: Accounts.Repo

  alias Accounts.Schema

  def user_token_factory do
    expire_at =
      DateTime.utc_now()
      |> DateTime.add(30 * 60, :second)
      |> DateTime.truncate(:second)

    %Schema.UserToken{
      type: "login",
      user: build(:user),
      expire_at: expire_at
    }
  end

  def user_factory do
    %Schema.User{
      email: sequence(:email, &"testing-#{&1}@example.com"),
      validated: false
    }
  end
end
