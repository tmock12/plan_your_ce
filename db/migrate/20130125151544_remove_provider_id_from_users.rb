class RemoveProviderIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :provider_id
  end
end
