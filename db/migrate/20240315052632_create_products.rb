class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code
      t.string :description
      t.string :type
      t.integer :amount
      t.string :extend
      t.string :brand
      t.decimal :purchase_price
      t.decimal :sale_price

      t.timestamps
    end
  end
end
