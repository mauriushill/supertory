# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :text
#  image_url   :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  has_one_attached :image
  # Keep consistent indentation, 1 space after association
  has_many :items, class_name: "Item", foreign_key: "product_id", dependent: :destroy
  has_many :facilities, through: :items, source: :facility
  has_many :purchases, through: :items, source: :purchase
  validates :name, presence: true
  validates :description, presence: true
end
