class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider,       null: false
      t.string :uid,            null: false
      t.string :name,           null: false
      t.string :username,       limit: 20
      t.string :email,          limit: 100
      t.string :bio,            limit: 140
      t.string :avatar
      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
