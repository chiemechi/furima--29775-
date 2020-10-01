class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :city,null:false
      t.string :building,null:false
      t.string :num,null:false
      t.string :phone_number,null:false
      t.integer :prefecture_id,null:false
      t.references :purchase ,null:false, foreign_key:true
      t.integer :postal_code,null: false
      t.integer :house_number,null: false
      t.timestamps
    end
  end
end
