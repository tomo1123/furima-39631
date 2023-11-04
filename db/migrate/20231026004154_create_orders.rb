class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.string :token, null: false
      t.string :price, null: false
      t.timestamps
      
    end
  end
end
