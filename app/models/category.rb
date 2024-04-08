# == Schema Information
#
# Table name: categories
#
#  id            :bigint           not null, primary key
#  tipe_category :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Category < ApplicationRecord
  validates :tipe_category, presence: true
  has_many :products, dependent: :restrict_with_exception
end
