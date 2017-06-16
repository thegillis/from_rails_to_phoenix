defmodule WidgetMarketPhoenix.Web.PageController do
  use WidgetMarketPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
