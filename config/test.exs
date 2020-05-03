use Mix.Config

# Configure your database
config :phoenix_boilerplate, PhoenixBoilerplate.Repo,
  url:
    System.get_env(
      "DATABASE_URL",
      "postgres://postgres:postgres@localhost:54320/arbejdsbasen_test"
    ),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_boilerplate, PhoenixBoilerplateWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :phoenix_boilerplate, Oban, crontab: false, queues: false, prune: :disabled
