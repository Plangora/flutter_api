# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :flutter_api,
  ecto_repos: [FlutterApi.Repo]

# Configures the endpoint
config :flutter_api, FlutterApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Prmm54NO78ty3G54zHJKGqwlPXKrxcDvhMv71Qnb5VIM4oGZqyxlrDX1w1Li4vOo",
  render_errors: [view: FlutterApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FlutterApi.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "7loCAJ7c"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
