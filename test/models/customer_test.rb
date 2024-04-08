# == Schema Information
#
# Table name: customers
#
#  id             :bigint           not null, primary key
#  identification :bigint
#  name           :text
#  phone          :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
