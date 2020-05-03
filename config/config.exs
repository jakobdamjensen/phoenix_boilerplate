# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_boilerplate,
  ecto_repos: [PhoenixBoilerplate.Repo]

# Configures the endpoint
config :phoenix_boilerplate, PhoenixBoilerplateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4RkislAEOUR+nGh4sTKx9jc5BI2/X9/ErodgSx7qXsCBJm48Q0363OJTNTWM1Yb+",
  render_errors: [view: PhoenixBoilerplateWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixBoilerplate.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix_boilerplate, :pow,
  user: PhoenixBoilerplate.Users.User,
  repo: PhoenixBoilerplate.Repo,
  cache_store_backend: Pow.Store.Backend.MnesiaCache,
  extensions: [PowPersistentSession],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks

config :phoenix_boilerplate, Oban,
  repo: PhoenixBoilerplate.Repo,
  prune: {:maxlen, 10_000},
  queues: [default: 10]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
