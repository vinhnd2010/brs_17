class ChangeRateToBooks < ActiveRecord::Migration
  def change
    change_column :books, :rate, :float, default: 0.0
  end
end
