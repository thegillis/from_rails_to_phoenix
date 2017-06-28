defmodule WidgetMarketPhoenix.Widgets.Widget do
  use Ecto.Schema
  import Ecto.Changeset
  alias WidgetMarketPhoenix.Widgets.Widget


  schema "widgets" do
    field :description, :string
    field :name, :string
    field :price_cents, :integer
    field :upc, :string

    timestamps()
  end

  @doc false
  def changeset(%Widget{} = widget, attrs) do
    widget
    |> cast(attrs, [:name, :description, :price_cents, :upc])
    |> validate_required([:name, :description, :price_cents, :upc])
  end
end
