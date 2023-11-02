class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  
  def index
    if @item.order.present? || current_user.id == @item.user_id
      flash[:alert] = "Item not found"
      redirect_to root_path
    end
    @order_address = OrderAddress.new
    gon.public_key = "pk_test_fd3698beeca22632c6b2739a"
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
      render :index, alert: '保存が失敗しました'
    end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:item_id])
    unless @item
      flash[:alert] = "Item not found"
      redirect_to root_path
    end
  end
  
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line_1, :building_name, :phone_number)
      .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  
end


