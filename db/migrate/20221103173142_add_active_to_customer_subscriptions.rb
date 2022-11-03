class AddActiveToCustomerSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_subscriptions, :active, :boolean
  end
end
