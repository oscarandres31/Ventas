class AddCategoryToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :category, null: false, foreign_key: true, presence: true
  end
end
