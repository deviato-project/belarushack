class AddResponsibleAdminUserIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :responsible_admin_user_id, :integer, index: true
  end
end
