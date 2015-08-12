class AddColumnFavoriteToBookUsers < ActiveRecord::Migration
  def change
    add_column :book_users, :favorite, :boolean, default: false
  end
end
