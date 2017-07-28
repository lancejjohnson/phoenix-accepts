# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :accepts, Accepts.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6hIF7yswov5V4N7Esi0mgRV7THWt72tFPWGjF+uZWt05yHR+j0yPlZnTI7wGX3AY",
  render_errors: [view: Accepts.ErrorView, accepts: ~w(json)],
  pubsub: [name: Accepts.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
