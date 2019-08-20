class AddAmountToCups < ActiveRecord::Migration[5.2]
  def change
    add_column :cups, :amount, :integer
  end
end
