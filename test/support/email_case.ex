defmodule Accounts.EmailCase do
  @moduledoc """
  This module helps test emails.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      import Swoosh.TestAssertions
    end
  end
end
