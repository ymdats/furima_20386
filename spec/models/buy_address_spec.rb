require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '住所の保存' do
    before do
      @buy_address = FactoryBot.build(:buy_address)
      sleep 0.2
    end

    it '全ての値が正しく入力されていれば保存できる' do
      expect(@buy_address).to be_valid
    end

    context '保存できない場合' do
      it '商品のuser_idと購入者idが同じだと保存できない' do
        @buy_address.user_id = @buy_address.seller_id
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User must be other than #{@buy_address.user_id}")
      end
      it '郵便番号が無いと保存できない' do
        @buy_address.postal_code = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県を選択しないと保存できない' do
        @buy_address.prefecture_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が無いと保存できない' do
        @buy_address.city = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が無いと保存できない' do
        @buy_address.house_number = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が無いと保存できない' do
        @buy_address.phone_number = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にハイフンが無いと保存できない' do
        @buy_address.postal_code = '6740051'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '電話にハイフンを含むと保存できない' do
        @buy_address.phone_number = '090-3470-2818'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is invalid. Not include hyphen(-)')
      end
    end
  end
end
