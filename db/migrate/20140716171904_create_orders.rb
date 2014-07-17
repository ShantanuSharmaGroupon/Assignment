class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :product_name
      t.string :product_description
      t.integer :product_price
      t.string :store
      t.string :address
      t.integer :contact
      t.integer :pincode
      t.string :name
      t.string :date
      
      t.timestamps
    end
  end
end
