class CreateToppings < ActiveRecord::Migration[5.2]
  def change
    create_table :toppings do |t|
      t.string :name
      t.string :img_url
      t.timestamps
    end
  end
end
