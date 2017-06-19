class RenameWidgetCreatedAt < ActiveRecord::Migration[5.1]
  def change
    rename_column :widgets, :created_at, :inserted_at
  end
end
