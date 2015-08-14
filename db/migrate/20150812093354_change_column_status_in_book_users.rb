class ChangeColumnStatusInBookUsers < ActiveRecord::Migration
  def change
    change_column :book_users, :status, :integer
  end
end
