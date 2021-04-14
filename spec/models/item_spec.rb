require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品登録ができるとき' do
      it 'フォームに全て記入されていれば登録できる' do
        expect(@item).to be_valid
      end
      it '商品名は、４０文字以内なら登録できる' do
        @item.product_name = 'あ' * 40
        expect(@item).to be_valid
      end
      it '商品説明は、１０００文字以内なら登録できる' do
        @item.description = 'あ' * 1000
        expect(@item).to be_valid
      end
    end
    context '商品登録ができないとき' do
      it '商品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
    it '商品名が空だと登録できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '商品名が４０文字以上だと登録できない' do
      @item.product_name = 'あ' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include('Product name is too long (maximum is 40 characters)')
    end
    it '商品説明が空だと登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it '商品説明が１０００文字以上だと登録できない' do
      @item.description = 'あ' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
    end
    it '商品カテゴリーが空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end
    it '商品カテゴリー:1を選択した場合、登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品状態についてが空だと登録できない' do
      @item.product_state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product state can't be blank", 'Product state is not a number')
    end
    it '商品状態:1を選択した場合、登録できない' do
      @item.product_state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Product state must be other than 1')
    end
    it '配送料の負担についてが空だと登録できない' do
      @item.shipping_charges_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges can't be blank", 'Shipping charges is not a number')
    end
    it '配送料の負担:1を選択した場合、登録できない' do
      @item.shipping_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charges must be other than 1')
    end
    it '発送元の地域についてが空だと登録できない' do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank", 'Shipping area is not a number')
    end
    it '発送元の地域:1を選択した場合、登録できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
    end
    it '発送までの日数についてが空だと登録できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank", 'Shipping day is not a number')
    end
    it '発送までの日数:1を選択した場合、登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
    end
    it '販売価格が空だと登録できない' do
      @item.selling_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank", 'Selling price is invalid')
    end
    it '販売価格が300円未満だと登録できない' do
      @item.selling_price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price must be greater than 299')
    end
    it '販売価格が1,000,000円以上だと登録できない' do
      @item.selling_price = 1_000_001
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price must be less than 1000000')
    end
  end
end
