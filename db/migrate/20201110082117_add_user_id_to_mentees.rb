class AddUserIdToMentees < ActiveRecord::Migration[6.0]
  def change
    add_column :mentees, :user_id, :integer
    add_index :mentees, :user_id
  end
end
