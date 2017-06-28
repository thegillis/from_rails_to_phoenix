defmodule WidgetMarketPhoenix.Web.WidgetControllerTest do
  use WidgetMarketPhoenix.Web.ConnCase

  alias WidgetMarketPhoenix.Widgets
  alias WidgetMarketPhoenix.Widgets.Widget

  @create_attrs %{description: "some description", name: "some name", price_cents: 42, upc: "some upc"}
  @update_attrs %{description: "some updated description", name: "some updated name", price_cents: 43, upc: "some updated upc"}
  @invalid_attrs %{description: nil, name: nil, price_cents: nil, upc: nil}

  def fixture(:widget) do
    {:ok, widget} = Widgets.create_widget(@create_attrs)
    widget
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, widget_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates widget and renders widget when data is valid", %{conn: conn} do
    conn = post conn, widget_path(conn, :create), widget: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, widget_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "description" => "some description",
      "name" => "some name",
      "price_cents" => 42,
      "upc" => "some upc"}
  end

  test "does not create widget and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, widget_path(conn, :create), widget: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen widget and renders widget when data is valid", %{conn: conn} do
    %Widget{id: id} = widget = fixture(:widget)
    conn = put conn, widget_path(conn, :update, widget), widget: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, widget_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "description" => "some updated description",
      "name" => "some updated name",
      "price_cents" => 43,
      "upc" => "some updated upc"}
  end

  test "does not update chosen widget and renders errors when data is invalid", %{conn: conn} do
    widget = fixture(:widget)
    conn = put conn, widget_path(conn, :update, widget), widget: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen widget", %{conn: conn} do
    widget = fixture(:widget)
    conn = delete conn, widget_path(conn, :delete, widget)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, widget_path(conn, :show, widget)
    end
  end
end
