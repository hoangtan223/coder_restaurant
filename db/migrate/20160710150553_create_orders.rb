class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :phone_number
      t.string :address
      t.decimal :shipping
      t.decimal :total_price

      t.timestamps
    end
  end
end
