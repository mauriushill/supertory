# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  receipt    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_purchases_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Purchase < ApplicationRecord
  has_one_attached :receipt
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  # Keep consistent indentation, 1 space after association
  has_many :items, class_name: "Item", foreign_key: "purchase_id", counter_cache: true
  has_many :folders, through: :items, source: :folder
  has_many :products, through: :items, source: :product
  has_many :comments, through: :items, source: :comments
end
