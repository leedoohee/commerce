class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories, :id=> false do |t|
      t.string :name
      t.string :category_id, primary_key: true
      t.references :parent, type: :string
      t.string :use_yn
      t.string :register_id
      t.string :updater_id
      t.datetime :create_at
      t.datetime :update_at
    end
  end
end