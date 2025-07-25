class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    # @items = Item.order(created_at: :desc) 一時コメントアウト
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @item = Item.find(params[:id]) 一時コメントアウト
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :status_id, :shipping_fee_payer_id, :shipping_region_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end