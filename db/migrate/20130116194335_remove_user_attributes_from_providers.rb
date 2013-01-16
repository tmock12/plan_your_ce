class RemoveUserAttributesFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :email
    remove_column :providers, :password_digest
    remove_column :providers, :session_token
  end
end
