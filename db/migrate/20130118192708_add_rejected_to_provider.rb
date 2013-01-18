class AddRejectedToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :rejected, :boolean, default: false
  end
end
