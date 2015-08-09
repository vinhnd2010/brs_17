class AddPulisherToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :pulisher, :string
  end
end
