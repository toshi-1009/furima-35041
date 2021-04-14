class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,            null: false           
      t.text :description,               null: false   
      t.integer :category_id,            null: false   
      t.integer :product_state_id,       null: false   
      t.integer :shipping_charges_id,    null: false   
      t.integer :shipping_area_id,       null: false   
      t.integer :shipping_day_id,        null: false         
      t.integer :selling_price,          null: false   
      t.references :user,                foreign_key: true
      t.timestamps
    end
  end
end
