# == Schema Information
#
# Table name: sales
#
#  id          :bigint           not null, primary key
#  charget     :decimal(, )
#  customer    :text
#  discount    :decimal(, )
#  id_customer :bigint
#  id_facture  :integer
#  id_product  :string
#  price       :decimal(, )
#  product     :string
#  quantity    :integer
#  returned    :decimal(, )
#  subtotal    :decimal(, )
#  total       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sale < ApplicationRecord
  has_many :sale_details, dependent: :destroy
  belongs_to :customer, optional: true
end
