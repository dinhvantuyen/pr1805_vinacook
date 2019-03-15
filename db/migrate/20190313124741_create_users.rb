class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :phone
      t.integer :role
      t.string :password_digest
      t.string :avatar

      t.timestamps
    end
  end
end
