class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :description, null: false
      t.decimal :price, null: false

      t.timestamps null: false
    end
  end
end
