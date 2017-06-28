defmodule WidgetMarketPhoenix.Web.WidgetController do
  use WidgetMarketPhoenix.Web, :controller

  alias WidgetMarketPhoenix.Widgets
  alias WidgetMarketPhoenix.Widgets.Widget

  action_fallback WidgetMarketPhoenix.Web.FallbackController

  def index(conn, _params) do
    widgets = Widgets.list_widgets()
    render(conn, "index.json", widgets: widgets)
  end

  def create(conn, %{"widget" => widget_params}) do
    with {:ok, %Widget{} = widget} <- Widgets.create_widget(widget_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", widget_path(conn, :show, widget))
      |> render("show.json", widget: widget)
    end
  end

  def show(conn, %{"id" => id}) do
    widget = Widgets.get_widget!(id)
    render(conn, "show.json", widget: widget)
  end

  def update(conn, %{"id" => id, "widget" => widget_params}) do
    widget = Widgets.get_widget!(id)

    with {:ok, %Widget{} = widget} <- Widgets.update_widget(widget, widget_params) do
      render(conn, "show.json", widget: widget)
    end
  end

  def delete(conn, %{"id" => id}) do
    widget = Widgets.get_widget!(id)
    with {:ok, %Widget{}} <- Widgets.delete_widget(widget) do
      send_resp(conn, :no_content, "")
    end
  end
end
