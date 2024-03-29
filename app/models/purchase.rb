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
  belongs_to :user
end
