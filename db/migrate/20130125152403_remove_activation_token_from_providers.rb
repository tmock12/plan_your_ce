class RemoveActivationTokenFromProviders < ActiveRecord::Migration
  def up
    remove_column :providers, :activation_token
  end

  def down
    add_column :providers, :activation_token, :string
  end
end
