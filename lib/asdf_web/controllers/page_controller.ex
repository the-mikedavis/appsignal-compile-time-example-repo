defmodule AsdfWeb.PageController do
  use AsdfWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
