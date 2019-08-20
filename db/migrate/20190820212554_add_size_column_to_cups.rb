class AddSizeColumnToCups < ActiveRecord::Migration[5.2]
  def change
    add_column :cups, :size, :string
  end
end
