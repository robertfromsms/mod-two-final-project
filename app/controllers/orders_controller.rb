class OrdersController < ApplicationController
  before_action :user_authenticate!

  def show
    @order = Order.find(params[:id])
    belong_to_user?(@order)
    @itemized = @order.menu_items
    @total = (@itemized.map {|item| item.price}).sum
  end

  def new
    @order = Order.new
    render :new
  end

  def new2
    @restaurant = restaurant.find(params[:order][:restaurant_id])
    @restaurant_menu = @restaurant.menu_items
    render :new2
  end

  def create
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant][:id])
    @order = Order.new(user_id: @user.id, restaurant_id: @restaurant.id)
    if @order.save
      redirect_to user_path(@user)
    else
      flash[:info] = "Something went wrong while completing your order. Try again."
      render :new
    end
  end
end