class CreateCupToppings < ActiveRecord::Migration[5.2]
  def change
    create_table :cup_toppings do |t|
      t.integer :cup_id
      t.integer :topping_id
      t.integer :amount
      t.timestamps
    end
  end
end
