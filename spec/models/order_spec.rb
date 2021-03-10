require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:user_order, user_id:  @user.id, item_id:  @item.id)
  sleep(0.5)
  end

  describe '注文' do
    context '注文の登録ができる時' do
      it 'すべてのカラムが正しく記述されている!' do
        expect(@order).to be_valid
      end


      it "建物が空でも登録できる" do
        @order.building_name = ""
        @order.valid?
      end
    end


    context '注文が登録ができない時' do

      it 'postcodeが空だと登録できない' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Postcode can't be blank","Postcode is invalid. Include hyphen(-)"
      end

      it 'postcodeが桁が違うと登録できない' do
        @order.postcode = '123-124'
        @order.valid?
        expect(@order.errors.full_messages).to include "Postcode is invalid. Include hyphen(-)"
      end
      
      it 'postcodeが桁が違うと登録できない' do
        @order.postcode = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include "Postcode is invalid. Include hyphen(-)"
      end

      it 'prefectureが1だと登録できない' do
        @order.prefecture = 1
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture must be other than 1"
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

      it 'addrbessが空だと登録できない' do
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

      it 'tellphoneが0123456789012だと登録できない' do
        @order.tellphone = '0123456789012'
        @order.valid?
        # binding.pry
        expect(@order.errors.full_messages).to include "Tellphone is invalid"
      end
                  
      it 'tokeneが空だと登録できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end

      it "user_idは空では登録できない" do
        @order.user_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "User can't be blank"
      end

      it "item_idは空では登録できない" do
        @order.item_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "Item can't be blank"
      end

    end
  end
end
