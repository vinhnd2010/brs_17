class ChangeColumnStatusInLikes < ActiveRecord::Migration
  def change
    change_column :likes, :status, :boolean, default: false
  end
end
