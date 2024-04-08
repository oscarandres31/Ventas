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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
