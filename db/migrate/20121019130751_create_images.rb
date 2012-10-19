class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :group
      t.boolean :private
      t.timestamps
      t.attachment :pic
      t.integer :user_id
    end
	add_index :images,[:user_id, :created_at]
  end
end
