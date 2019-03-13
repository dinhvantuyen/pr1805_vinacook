class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :star
      t.references :user
      t.references :product

      t.timestamps
    end
  end
end
