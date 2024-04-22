class CreateProductsImage < ActiveRecord::Migration[7.1]
  def change
    create_table :products_image do |t|
      t.integer :product_id
      t.string  :src
      t.string :use_yn
      t.datetime :create_at
      t.datetime :update_at
    end
  end
end