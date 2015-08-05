class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :status
      t.references :user, index: true, foreign_key: true
      t.string :book_name

      t.timestamps null: false
    end
  end
end
