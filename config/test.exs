use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :shield_guy, ShieldGuy.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :shield_guy, ShieldGuy.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "shield_guy_test",
  size: 1,
  max_overflow: false
