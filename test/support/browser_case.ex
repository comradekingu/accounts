defmodule AccountsWeb.BrowserCase do
  @moduledoc """
  This module defines a test using `Hound` to test in a browser session.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use Hound.Helpers

      alias AccountsWeb.Router.Helpers, as: Routes

      import AccountsWeb.BrowserCase

      @endpoint AccountsWeb.Endpoint

      hound_session()
    end
  end

  @doc """
  Iterates over the given values and submits the form.

  ## Examples

    iex> submit_form(".login", [username: "admin", password: "password"])
  """
  def submit_form(selector, values) do
    form = Hound.Helpers.Page.find_element(:css, selector)

    Enum.each(values, fn {key, value} ->
      form
      |> Hound.Helpers.Page.find_within_element(:css, key)
      |> Hound.Helpers.Element.fill_field(value)
    end)

    Hound.Helpers.Element.submit_element(form)
  end
end
