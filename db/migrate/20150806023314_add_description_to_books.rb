class AddDescriptionToBooks < ActiveRecord::Migration
  def change
    add_column :books, :description, :text
    add_column :books, :rate, :float
  end
end
