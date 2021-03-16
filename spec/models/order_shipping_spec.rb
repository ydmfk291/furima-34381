require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
      sleep 0.2
    end
    context '商品の購入記録がされる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it '建物名がなくても保存できること' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
    end
    context '商品の購入記録が保存されない時' do
      it 'tokenがないと保存できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it '紐づく商品情報がないと保存できないこと' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空では保存できないこと' do
        @order_shipping.post_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_shipping.post_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Post code Input correctly')
      end
      it '都道府県を選択しないと保存できないこと' do
        @order_shipping.prefecture_id = 0
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Prefecture Select')
      end
      it '市町村の入力がないと保存できないこと' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_shipping.tel_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Tel number can't be blank")
      end
      it '電話番号に数値以外があると保存できないこと' do
        @order_shipping.tel_number = '090-1234-5678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Tel number Input only number')
      end
      it '電話番号に英字が混ざっても保存できないこと' do
        @order_shipping.tel_number = 'tel09012345'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Tel number Input only number')
      end
      it '電話番号が11桁を超えると保存できないこと' do
        @order_shipping.tel_number = '090123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Tel number Input only number")
      end
    end
  end
end