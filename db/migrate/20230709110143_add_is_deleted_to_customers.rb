class AddIsDeletedToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_deleted, :boolean, default: false
    add_column :customers, :last_name, :string, null: false
    add_column :customers, :first_name, :string, null: false
    add_column :customers, :customer_id, :integer, null: false
    add_column :customers, :paymet_method, :integer, null: false
    add_column :customers, :payment_amount, :integer, null: false
    add_column :customers, :postage, :integer, null: false
    add_column :customers, :postal_code, :string, null: false
    add_column :customers, :address, :string, null: false
  end
end
