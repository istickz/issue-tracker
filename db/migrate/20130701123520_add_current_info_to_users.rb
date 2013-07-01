class AddCurrentInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_info, :string
  end
end
