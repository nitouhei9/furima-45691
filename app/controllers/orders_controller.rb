class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :check_access, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_region_id, :city, :street, :building, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_access
    # 自分の商品は購入できない
    if @item.user_id == current_user.id
      redirect_to root_path
    end
    # 売却済み商品は購入できない
    if @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    # PAY.JP決済処理（後で実装）
  end
end