# == Schema Information
#
# Table name: facilities
#
#  id         :integer          not null, primary key
#  address    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Facility < ApplicationRecord
  has_many  :items, class_name: "Item", foreign_key: "facility_id", dependent: :nullify, counter_cache: true
  has_many :folders, through: :items, source: :folder
  has_many :products, through: :items, source: :product
  validates :address, presence: true, uniqueness: true
  validates :name, presence: true
end
