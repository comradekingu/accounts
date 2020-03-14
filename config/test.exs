import Config

config :accounts, Accounts.Repo,
  username: "postgres",
  password: "postgres",
  database: "accounts_test",
  pool: Ecto.Adapters.SQL.Sandbox

config :accounts, AccountsWeb.Endpoint,
  http: [port: 4002],
  server: true

config :hound,
  driver: System.get_env("WEBDRIVER") || "chrome_driver",
  browser: System.get_env("BROWSER") || "chrome",
  port: 4444,
  app_port: 4002

config :accounts, Accounts.Mailer, adapter: Swoosh.Adapters.Test

config :logger, level: :warn
