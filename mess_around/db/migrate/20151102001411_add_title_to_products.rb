class AddTitleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :title, :string
    change_column_null :products, :title, false
    add_index :products, :title
  end
end
