class AddSessionTokenToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :session_token, :string
  end
end
