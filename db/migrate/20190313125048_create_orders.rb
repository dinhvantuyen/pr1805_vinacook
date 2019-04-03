class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :subtotal
      t.integer :code
      t.integer :phone
      t.string :email
      t.string :name
      t.string :address
      t.string :status

      t.timestamps
    end
  end
end
