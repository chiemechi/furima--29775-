class OrdersController < ApplicationController
  before_action :move_to_order_index, only: :index
  before_action :set_params, only: [:index,:create]

  def index
    @order_address = OrderAddress.new
    if @item.order.present?
      redirect_to root_path
   end
   
   if user_signed_in? && current_user.id == @item.user_id 
     redirect_to root_path
   end
   
  end

  def create   
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
    
  end

  private

  def order_address_params
    params.permit(:city, :building, :phone_number, :prefecture_id, :postal_code, :house_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_order_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_params
    @item = Item.find(params[:item_id])
  end
end
