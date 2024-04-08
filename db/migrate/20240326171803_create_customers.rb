class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.bigint :identification
      t.text :name
      t.bigint :phone

      t.timestamps
    end
  end
end
