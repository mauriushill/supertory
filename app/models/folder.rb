# == Schema Information
#
# Table name: folders
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Folder < ApplicationRecord
  has_many  :items, class_name: "Item", foreign_key: "folder_id", dependent: :destroy
  has_many :purchases, through: :items, source: :purchase
  has_many :facilities, through: :items, source: :facility
  validates :name, presence: true
end
