class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.datetime :publish_date
      t.string :author
      t.integer :num_pages
      t.references :category, index: true, foreign_key: true
      t.string :slug

      t.timestamps null: false
    end
    add_index :books, :slug, unique: true
  end
end
