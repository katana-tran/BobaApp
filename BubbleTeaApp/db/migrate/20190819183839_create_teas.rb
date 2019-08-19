class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :origin
      t.string :name
      t.text :description
      t.text :benefits
      t.string :color
      t.timestamps
    end
  end
end
