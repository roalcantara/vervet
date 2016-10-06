class CreateFollowings < ActiveRecord::Migration[5.0]
  def change
    create_table :followings do |t|
      t.references :user,     null: false, index: true
      t.references :follower, null: false, references: :users, index: true
      t.timestamps
    end
  end
end
