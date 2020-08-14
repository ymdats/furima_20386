class Address < ApplicationRecord
  belongs_to :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code, :city, :house_number, :phone_number
    validates :prefecture, numericality: { other_than: 1 }
  end
end
