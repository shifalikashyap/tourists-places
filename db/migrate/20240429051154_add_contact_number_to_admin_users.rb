class AddContactNumberToAdminUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :contact_number, :string
  end
end
