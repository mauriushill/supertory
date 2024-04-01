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
  has_many  :items, class_name: "Item", foreign_key: "folder_id", dependent: :nullify
end
