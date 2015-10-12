use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :shield_guy, ShieldGuy.Endpoint,
  secret_key_base: "XR7e8rPXq2nIdBXqtPsyxPz1R1UF3w4HDBFGdxZ+9GDZCT6PpG4aJLpOzehOJVO5"

# Configure your database
config :shield_guy, ShieldGuy.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "shield_guy_prod"
