class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  postal = /\A[0-9]{3}-[0-9]{4}\z/
  phone = /\A[0-9]{11}\z/
  
  with_options presence: true do
    validates :postal_code, format: { with: postal, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: phone, message: 'is invalid. Not include hyphen(-)' }
    validates :city, :house_number
    validates :prefecture_id, numericality: { other_than: 1 }
    # validates :user_id, numericality: { other_than: :seller_id }
  end
  
  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
