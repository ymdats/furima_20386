class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :buy_id, :token

  with_options presence: true do
    validates :postal_code, :city, :house_number, :phone_number
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    buy = Buy.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end