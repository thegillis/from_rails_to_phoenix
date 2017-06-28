defmodule WidgetMarketPhoenix.WidgetsTest do
  use WidgetMarketPhoenix.DataCase

  alias WidgetMarketPhoenix.Widgets

  describe "widgets" do
    alias WidgetMarketPhoenix.Widgets.Widget

    @valid_attrs %{description: "some description", name: "some name", price_cents: 42, upc: "some upc"}
    @update_attrs %{description: "some updated description", name: "some updated name", price_cents: 43, upc: "some updated upc"}
    @invalid_attrs %{description: nil, name: nil, price_cents: nil, upc: nil}

    def widget_fixture(attrs \\ %{}) do
      {:ok, widget} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Widgets.create_widget()

      widget
    end

    test "list_widgets/0 returns all widgets" do
      widget = widget_fixture()
      assert Widgets.list_widgets() == [widget]
    end

    test "get_widget!/1 returns the widget with given id" do
      widget = widget_fixture()
      assert Widgets.get_widget!(widget.id) == widget
    end

    test "create_widget/1 with valid data creates a widget" do
      assert {:ok, %Widget{} = widget} = Widgets.create_widget(@valid_attrs)
      assert widget.description == "some description"
      assert widget.name == "some name"
      assert widget.price_cents == 42
      assert widget.upc == "some upc"
    end

    test "create_widget/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Widgets.create_widget(@invalid_attrs)
    end

    test "update_widget/2 with valid data updates the widget" do
      widget = widget_fixture()
      assert {:ok, widget} = Widgets.update_widget(widget, @update_attrs)
      assert %Widget{} = widget
      assert widget.description == "some updated description"
      assert widget.name == "some updated name"
      assert widget.price_cents == 43
      assert widget.upc == "some updated upc"
    end

    test "update_widget/2 with invalid data returns error changeset" do
      widget = widget_fixture()
      assert {:error, %Ecto.Changeset{}} = Widgets.update_widget(widget, @invalid_attrs)
      assert widget == Widgets.get_widget!(widget.id)
    end

    test "delete_widget/1 deletes the widget" do
      widget = widget_fixture()
      assert {:ok, %Widget{}} = Widgets.delete_widget(widget)
      assert_raise Ecto.NoResultsError, fn -> Widgets.get_widget!(widget.id) end
    end

    test "change_widget/1 returns a widget changeset" do
      widget = widget_fixture()
      assert %Ecto.Changeset{} = Widgets.change_widget(widget)
    end
  end
end
