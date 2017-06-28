defmodule WidgetMarketPhoenix.Web.WidgetView do
  use WidgetMarketPhoenix.Web, :view
  alias WidgetMarketPhoenix.Web.WidgetView

  def render("index.json", %{widgets: widgets}) do
    %{data: render_many(widgets, WidgetView, "widget.json")}
  end

  def render("show.json", %{widget: widget}) do
    %{data: render_one(widget, WidgetView, "widget.json")}
  end

  def render("widget.json", %{widget: widget}) do
    %{id: widget.id,
      name: widget.name,
      description: widget.description,
      price_cents: widget.price_cents,
      upc: widget.upc}
  end
end
