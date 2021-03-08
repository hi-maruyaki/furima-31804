require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @order = FactoryBot.build(:user_order)
  end
  describe '注文' do
    context '注文の登録ができる時' do
      it 'すべてのカラムが正しく記述されている!' do
        expect(@order).to be_valid
      end
    end


    context '注文が登録ができない時' do
      
      it 'postcodeが空だと登録できない' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Postcode is invalid. Include hyphen(-)"
      end

      it 'postcodeが桁が違うと登録できない' do
        @order.postcode = '123-124'
        @order.valid?
        expect(@order.errors.full_messages).to include "Postcode is invalid. Include hyphen(-)"
      end

      it 'prefectureが1だと登録できない' do
        @order.prefecture = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture must be other than 1"
      end 

      it 'prefectureが空だと登録できない' do
        @order.prefecture = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank", "Prefecture is not a number"
      end

      it 'prefectureが空だと登録できない' do
        @order.prefecture = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank", "Prefecture is not a number"
      end

      it 'cityが空だと登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "City can't be blank"
      end

      it 'addressが空だと登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Address can't be blank"
      end

      it 'addressが空だと登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Address can't be blank"
      end

      it 'tellphoneが空だと登録できない' do
        @order.tellphone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Tellphone can't be blank", "Tellphone is invalid"
      end

      it 'tellphoneが080-1234-1234だと登録できない' do
        @order.tellphone = '080-1234-1234'
        @order.valid?
        expect(@order.errors.full_messages).to include "Tellphone is invalid"
      end
    end
  end
end
