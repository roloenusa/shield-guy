defmodule ShieldGuy.Endpoint do
  use Phoenix.Endpoint, otp_app: :shield_guy

  socket "/socket", ShieldGuy.UserSocket


  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :shield_guy,
    only: ~w(css images js favicon.ico robots.txt)

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.CodeReloader
    plug Phoenix.LiveReloader
  end


  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_shield_guy_key",
    signing_salt: "LH6XmqGb",
    encryption_salt: "CIPZg4Qo"

  plug ShieldGuy.Router
end
