class AddAuthorToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :author, :string
  end
end
