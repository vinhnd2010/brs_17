class ChangeScoreToReviews < ActiveRecord::Migration
  def change
    change_column :reviews, :score, :integer, default: 0
  end
end
