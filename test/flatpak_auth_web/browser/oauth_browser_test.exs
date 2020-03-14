defmodule AccountsWeb.OauthBrowserTest do
  use Accounts.DataCase
  use Accounts.EmailCase
  use AccountsWeb.BrowserCase

  setup do
    @endpoint
    |> Routes.oauth_path(:index)
    |> navigate_to()

    :ok
  end

  test "registering a new account" do
    submit_form("form", %{
      "[type='email']": "testing@example.com"
    })

    visible_page_text() |> IO.inspect(label: "text") =~ "email"

    token = Repo.one!(Schema.UserToken)
    assert_email_sent Accouts.Email.send(token)

    in_browser_session "email_click", fn ->
      navigate_to Routes.oauth_path(:complete, token.id)
      visible_page_text() |> IO.inspect(label: "email") =~ "complete"
    end

    visible_page_text() |> IO.inspect(label: "complete") =~ "complete"
  end
end
