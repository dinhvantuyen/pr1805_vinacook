class CreateProductOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :product_orders do |t|
      t.integer :quantity
      t.references :order
      t.references :product

      t.timestamps
    end
  end
end
