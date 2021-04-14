class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :image, :description, :category_id, :product_state_id, :shipping_charges_id,
                                 :shipping_area_id, :shipping_day_id, :selling_price).merge(user_id: current_user.id)
  end
end
