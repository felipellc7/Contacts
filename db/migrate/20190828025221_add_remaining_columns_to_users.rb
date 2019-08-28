class AddRemainingColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :address, :string
  	add_column :users, :phone, :integer, limit: 8
  	add_column :users, :photo, :string
  end
end
