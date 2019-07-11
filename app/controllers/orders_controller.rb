class OrdersController < ApplicationController
  before_action :user_authenticate!

  def new
    @order = Order.new
    @restaurants = Restaurant.all
    render :new
  end

  def new2
    if params[:restaurant_id] 
      @restaurant = Restaurant.find(params[:restaurant_id])
      @restaurant_menu = @restaurant.menu_items
      render :new2
    else
      flash[:info] = "You must make a restaurant selection."
      redirect_to new_order_path
    end
  end

  def redirect
    flash[:info] = "Something went wrong while completing your order. Try again."
    redirect_to new_order_path
  end

  def show
    @order = Order.find(params[:id])
    belong_to_user?(@order)
    @itemized = @order.menu_items
    @total = (@itemized.map {|item| item.price}).sum
  end

  def create
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant][:id])
    @order_items = params[:order_items]
    @order = Order.new(user_id: @user.id, restaurant_id: @restaurant.id)
    if @order.save
      if @order.make_order_items_all_successful?(@order_items)
        flash[:info] = "Order completed successfully!"
        redirect_to user_path(@user)
      else
        flash[:info] = "Something went wrong while completing your order. Try again."
        redirect_to new_order_path
      end
    else
      flash[:info] = "Something went wrong while completing your order. Try again."
      render :new
    end
  end
end