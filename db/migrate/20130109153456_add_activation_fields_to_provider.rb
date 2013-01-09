class AddActivationFieldsToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :activation_token, :string
    add_column :providers, :activated_at, :datetime
    add_index :providers, :activation_token
  end
end
