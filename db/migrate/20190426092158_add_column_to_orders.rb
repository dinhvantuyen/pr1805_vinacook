class AddColumnToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :country, :string
    add_column :orders, :city, :string
  end
end
