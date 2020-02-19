defmodule FlutterApiWeb.PageController do
  use FlutterApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
