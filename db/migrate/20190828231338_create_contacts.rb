class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :address
      t.integer :phone, limit: 8
      t.string :social_networks, array: true, default: []

      t.timestamps
    end
  end
end
