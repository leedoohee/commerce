class CreateProductsStock < ActiveRecord::Migration[7.1]
  def change
    create_table :products_stock do |t|
      t.integer :product_option_id
      t.integer :plus_price
      t.integer :quantity
      t.datetime :create_at
      t.datetime :update_at
    end
  end
end