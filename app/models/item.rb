# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  status      :boolean          default(FALSE)
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
  belongs_to :facility
  belongs_to :folder
  belongs_to :purchase
  belongs_to :product
end
