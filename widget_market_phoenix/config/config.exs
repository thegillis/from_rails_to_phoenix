# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :widget_market_phoenix,
  ecto_repos: [WidgetMarketPhoenix.Repo]

# Configures the endpoint
config :widget_market_phoenix, WidgetMarketPhoenix.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J90BBl/670pup9nHH5kR/Dv5amDaQtOD9vvK2TUdCS2mDvUSAVd9DmAMPtdyrU7a",
  render_errors: [view: WidgetMarketPhoenix.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WidgetMarketPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :widget_market_phoenix, :reverse_proxy,
  host: "http://172.21.0.1:3000"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :mix_docker, image: "thegillis/widget_market_phoenix"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
