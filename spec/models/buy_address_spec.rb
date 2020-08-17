require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '住所の保存' do
    before do
      @seller = FactoryBot.build(:user)
      @buyer =FactoryBot.build(:user)
      @buy_address = FactoryBot.build(:buy_address)
    end

    context '住所が保存できる場合' do
      it '全ての住所カラムが存在すれば保存される' do
        expect(@buy_address).to be_valid
      end
    end
    context '住所が保存できない場合' do
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
