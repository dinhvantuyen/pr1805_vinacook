class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :country
      t.integer :phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
