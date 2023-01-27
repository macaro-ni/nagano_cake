class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.timestamps
      
      #追加したカラム
      t.integer :customer_id, null: false, foreign_key: true
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      
    end
  end
end
