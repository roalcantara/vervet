class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :kind,        null: false
      t.string :description,  null: false
      t.string :location,     null: false
      t.references :author,   null: false, references: :users, index: true

      t.timestamps
    end
  end
end
