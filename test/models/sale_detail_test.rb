# == Schema Information
#
# Table name: sale_details
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  sale_id    :bigint           not null
#
# Indexes
#
#  index_sale_details_on_product_id  (product_id)
#  index_sale_details_on_sale_id     (sale_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (sale_id => sales.id)
#
require "test_helper"

class SaleDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
