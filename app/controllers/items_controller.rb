class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  #def show
    #@item = Item.find(params[:id])
    #@items = Item.all
  #end


  private
  def item_params
    params.require(:item).permit(:title, :items_text, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price, images_attributes: [:image]).merge(user_id: current_user.id)
  end



end
