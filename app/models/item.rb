class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_duration

  with_options presence: true do
    validates :image, :name, :explain
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_duration_id
    end
  end
end
