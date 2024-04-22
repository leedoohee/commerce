class CreateProductsPrice < ActiveRecord::Migration[7.1]
  def change
    create_table :products_price do |t|
      t.integer :product_id
      t.integer :price
      t.integer :wonga
      t.datetime :create_at
      t.datetime :update_at
    end
  end
end