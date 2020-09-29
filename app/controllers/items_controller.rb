class ItemsController < ApplicationController
  before_action :move_to_index, except: :index


  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item=Item.new(item_params)
    if@item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  
  
  private
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end  
  def item_params
    params.require(:item).permit( :name,:description,:price,:image,:category_id,:condition_id,:charges_id,:area_id,:send_date_id).merge(user_id: current_user.id)
  end

end
