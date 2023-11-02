class ItemsController < ApplicationController


  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @items = Item.all
    gon.item_price = @item.price
  end

  def edit
    @item_user = Item.find_by(id: params[:id])
    if @item_user.id.nil?
      redirect_back_or_to root_path, alert: 'Item not found.'
      return
    end
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item), alert: 'You are not authorized to delete this item.'
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :items_text, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end



end
