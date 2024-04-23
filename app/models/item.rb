# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  status      :integer          default("not_active")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  facility_id :integer          not null
#  folder_id   :integer          not null
#  product_id  :integer          not null
#  purchase_id :integer          not null
#
# Indexes
#
#  index_items_on_facility_id  (facility_id)
#  index_items_on_folder_id    (folder_id)
#  index_items_on_product_id   (product_id)
#  index_items_on_purchase_id  (purchase_id)
#
# Foreign Keys
#
#  facility_id  (facility_id => facilities.id)
#  folder_id    (folder_id => folders.id)
#  product_id   (product_id => products.id)
#  purchase_id  (purchase_id => purchases.id)
#
class Item < ApplicationRecord
  enum status: { "Not Active": 0, "Active": 1 }
  has_many  :comments, class_name: "Comment", foreign_key: "item_id", dependent: :destroy
  belongs_to :facility, required: true, class_name: "Facility", foreign_key: "facility_id"
  belongs_to :folder, required: true, class_name: "Folder", foreign_key: "folder_id"
  belongs_to :product, required: true, class_name: "Product", foreign_key: "product_id"
  belongs_to :purchase, required: true, class_name: "Purchase", foreign_key: "purchase_id"
  has_one  :user, through: :purchase, source: :user
end
