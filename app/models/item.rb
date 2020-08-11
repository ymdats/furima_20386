class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associatons::ActiveRecordExtemsions
  belongs_to_active_hash :category, :status, :shipping_charge, :shipping_area, :shipping_duration

  with_options presence: true do
    validates :image, :name, :explain, :price
    with_options numericality: { other_than: 1 } do
      validates :category, :status, :shipping_charge, :shipping_area, :shipping_duration
    end
  end
end
