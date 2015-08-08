class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :status
      t.integer :user_id
     t.datetime :created_at
  end
  add_index :carts, :user_id
end
end
