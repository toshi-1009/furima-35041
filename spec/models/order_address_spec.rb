require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    # user = FactoryBot.create(:user)
      # item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '購入情報の保存ができる' do
    end
    it '全て入力されていれば、保存ができる' do
      expect(@order_address).to be_valid
    end
    it '建物名が空でも保存できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end
  
  context '購入情報の保存ができない' do
    it '郵便番号が空だと保存できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code Input correctly")
    end
    it '郵便番号にハイフンがないと保存できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
    end
    it '都道府県が空だと保存できない' do
      @order_address.shipping_area_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping area can't be blank", "Shipping area Select")
    end
    it '都道府県で:1を選択すると保存できない' do
      @order_address.shipping_area_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping area Select")
    end
    
    it '市町村が空だと保存できない' do
      @order_address.municipalities = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it '番地が空だと保存できない' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと保存できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number Input only number")
    end
    it '電話番号は、数値でなければ保存できない'do
      @order_address.phone_number = '0901111222a'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end
    it '電話番号は、11桁以上だと保存できない'do
    @order_address.phone_number = '090111122222'
    @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end
    it 'ユーザーに関する情報がないと保存できない'do
    @order_address.user_id = ''
    @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it '商品に関する情報がないと保存できない'do
    @order_address.item_id = ''
    @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    
  end
end

end
