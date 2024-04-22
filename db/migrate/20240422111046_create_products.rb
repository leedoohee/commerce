class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string  :name
      t.integer :state
      t.string  :category_id
      t.string  :company
      t.string  :origin
      t.integer :margin_rate
      t.string  :tax_yn
      t.string  :introduce_img_src
      t.datetime :create_at
      t.datetime :update_at
    end
  end
end