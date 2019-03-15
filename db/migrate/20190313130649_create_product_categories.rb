class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.references :category
      t.references :product

      t.timestamps
    end
  end
end
