class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :image, :name, :explain, :category, :status, :shipping_charge, :shipping_area, :shipping_duration, :price
  end
end
