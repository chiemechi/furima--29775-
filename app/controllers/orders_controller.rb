class OrdersController < ApplicationController
  before_action :move_to_order_index, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
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
    Payjp.api_key = 'sk_test_3c0691336629bb2e58f357a4'  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_order_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
