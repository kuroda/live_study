# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :live_study, LiveStudyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lqbfJl6Sto2RjL8jesZrPTFN5cfBusH5OeeZ2ifBwHPqen6pBE1/mernY+o34GKA",
  render_errors: [view: LiveStudyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveStudy.PubSub,
  live_view: [signing_salt: "oYFGRFqP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
