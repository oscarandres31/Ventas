# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  amount         :integer
#  brand          :string
#  code           :string
#  description    :string
#  extend         :string
#  guy            :string
#  purchase_price :decimal(, )
#  sale_price     :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord
  validates :code, :description, :guy, :amount, :extend, :brand, :purchase_price, :sale_price, presence: true
  belongs_to :category

  def self.buscador(termino)
    Product.where("description LIKE ?", "%#{termino}%")
  end
end
