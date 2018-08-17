class AddUserIdToWrites < ActiveRecord::Migration
  def change
    add_column :writes, :user_id, :integer
  end
end
