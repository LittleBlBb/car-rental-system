class AddVipToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :vip, :boolean
  end
end
