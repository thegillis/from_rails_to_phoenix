json.extract! widget, :id, :name, :description, :price_cents, :upc, :created_at, :updated_at
json.url v1_widget_url(widget, format: :json)
