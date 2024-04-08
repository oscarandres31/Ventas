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
class Customer < ApplicationRecord
end
