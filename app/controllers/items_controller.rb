class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_items, only: [:show, :update,:edit,:destroy]
  before_action :set_show, only: [:update,:edit,:destroy]



  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if@item.update(item_params)
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :condition_id, :charges_id, :area_id, :send_date_id).merge(user_id: current_user.id)
  end
 

  def set_items
    @item = Item.find(params[:id])
  end

  def set_show
  if user_signed_in? && current_user.id !=  @item.user_id
    redirect_to item_path(item.id)
  end
  end

end
