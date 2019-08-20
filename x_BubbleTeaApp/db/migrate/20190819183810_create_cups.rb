class CreateCups < ActiveRecord::Migration[5.2]
  def change
    create_table :cups do |t|
      t.integer :straw_id
      t.integer :tea_id
      t.integer :user_id
      t.string :name
      t.timestamps
    end
  end
end
