require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_delivery = FactoryBot.build(:buy_delivery, user_id: user.id, item_id: item.id)
    end

    context '購入ができるとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@buy_delivery).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @buy_delivery.building = ''
        expect(@buy_delivery).to be_valid
      end
    end

    context '購入できないとき' do
      it 'postal_codeが空だと購入できないこと' do
        @buy_delivery.postal_code = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @buy_delivery.postal_code = '1234567'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが3桁と4桁の半角数字を含まないと購入できないこと' do
        @buy_delivery.postal_code = '12-345'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと購入できないこと' do
        @buy_delivery.prefecture_id = 1
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municiplityが空だと購入できないこと' do
        @buy_delivery.municipality = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できないこと' do
        @buy_delivery.address = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'call_numberが空だと購入できないこと' do
        @buy_delivery.call_number = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Call number can't be blank")
      end
      it 'call_numberが半角数字のみでないと購入できない' do
        @buy_delivery.call_number = '111-111-1111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Call number is invalid")
      end
      it 'call_numberが9桁以下だと購入できないこと' do
        @buy_delivery.call_number = '111111111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Call number is invalid")
      end
      it 'call_numberが12桁以上だと購入できないこと' do
        @buy_delivery.call_number = '111111111111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Call number is invalid")
      end
      it 'userが紐付いていないと購入できないこと' do
        @buy_delivery.user_id = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @buy_delivery.item_id = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できないこと' do
        @buy_delivery.token = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end