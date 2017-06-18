class CreateWidgets < ActiveRecord::Migration[5.1]
  def change
    create_table :widgets do |t|
      t.string :name
      t.text :description
      t.integer :price_cents
      t.string :upc

      t.timestamps
    end
    add_index :widgets, :upc, unique: true
  end
end
