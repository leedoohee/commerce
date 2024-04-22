class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :parent_id
      t.string :use_yn
      t.string :register_id
      t.string :updater_id
      t.datetime :create_at
      t.datetime :update_at
    end
  end
end