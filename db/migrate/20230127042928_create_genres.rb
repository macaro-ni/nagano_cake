class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|

      t.timestamps
      
      #追加したカラム
      t.string :name, null: false
    end
  end
end
