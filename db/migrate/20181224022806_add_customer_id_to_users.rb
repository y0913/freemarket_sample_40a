class AddCustomerIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :customer_id, :string, default: "cus_acd01324dde1603d181d040f7a8f"
  end
end
