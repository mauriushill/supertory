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
  has_many  :items, class_name: "Item", foreign_key: "facility_id", dependent: :nullify
end
