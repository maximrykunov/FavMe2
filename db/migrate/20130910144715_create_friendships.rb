class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :state
      t.string :message, limit: 500

      t.timestamps
    end

    add_index :friendships, [:user_id, :state]
    add_index :friendships, [:friend_id, :state]
  end
end
