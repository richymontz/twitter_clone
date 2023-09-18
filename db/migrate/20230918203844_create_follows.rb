class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.integer :from_user_id
      t.integer :to_user_id

      t.timestamps
    end
    add_index :follows, :from_user_id
    add_index :follows, :to_user_id
  end
end
