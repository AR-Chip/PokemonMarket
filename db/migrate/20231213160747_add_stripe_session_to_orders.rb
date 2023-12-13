class AddStripeSessionToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :stripe_session_id, :string
  end
end
