class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :id_facture
      t.string :id_product
      t.string :product
      t.integer :quantity
      t.decimal :price
      t.decimal :subtotal
      t.decimal :total
      t.decimal :discount
      t.decimal :charget
      t.decimal :returned
      t.bigint :id_customer
      t.text :customer

      t.timestamps
    end
  end
end
