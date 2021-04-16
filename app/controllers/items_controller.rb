class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update]
  def index
    @items = Item.order('created_at DESC')
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

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @items = Item.find(params[:id])
  end

  def update
    @items = Item.find(params[:id])
    if @items.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :image, :description, :category_id, :product_state_id, :shipping_charges_id,
                                 :shipping_area_id, :shipping_day_id, :selling_price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @items = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @items.user_id
  end
end
