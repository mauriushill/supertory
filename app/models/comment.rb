# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_item_id  (item_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  item_id  (item_id => items.id)
#  user_id  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :item, required: true, class_name: "Item", foreign_key: "item_id"
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_one  :purchase, through: :item, source: :purchase
  validates :body, presence: true
end
