class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.timestamps
      
      #追加したカラム
      t.integer :item_id, null: false, foreign_key: true
      t.integer :customer_id, null: false, foreign_key: true
      t.integer :amount, null: false
      
    end
  end
end
