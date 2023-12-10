class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.float :tax
      t.float :subtotal
      t.string :status

      t.timestamps
    end
  end
end
