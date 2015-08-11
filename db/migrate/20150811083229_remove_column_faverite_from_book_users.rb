class RemoveColumnFaveriteFromBookUsers < ActiveRecord::Migration
  def change
    remove_column :book_users, :faverite, :boolean
  end
end
