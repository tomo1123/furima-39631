class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :items_text, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_day_id, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true, null: false
      

      t.timestamps
    end
  end
end
