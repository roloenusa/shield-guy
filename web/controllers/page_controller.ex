defmodule ShieldGuy.PageController do
  use ShieldGuy.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
