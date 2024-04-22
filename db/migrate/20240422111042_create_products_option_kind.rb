class CreateProductsOptionKind < ActiveRecord::Migration[7.1]
  def change
    create_table :products_option_kind do |t|
      t.integer :product_id
      t.string  :type
      t.string  :name
      t.string  :use_yn
      t.datetime :create_at
      t.datetime :update_at
    end
  end
end