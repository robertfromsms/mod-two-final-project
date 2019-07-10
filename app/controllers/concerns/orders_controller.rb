class OrdersController < ApplicationController
  # before_action :authenticate!

  def show
    @order = Order.find(params[:id])
    @itemized = @order.menuitems
    @total = (@itemized.map {|item| item.price}).sum
    render :show
  end

  def new
    @order = Order.new
    render :new
  end

  def new2
    @restaurant = restaurant.find(params[:order][:restaurant_id])
    @restaurant_menu = @restaurant.menuitems
    render :new2
  end

  def create
    byebug
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant][:id])
    @order = Order.new(user_id: @user.id, restaurant_id: @restaurant.id)
    if @order.save || 
      redirect_to user_path(@user)
    else
      flash[:info] = "Something went wrong while completing your order. Try again."
      render :new
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  #   render :edit
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     redirect_to user_path(@user)
  #   else
  #     flash[:info] = "Something went wrong. Try again."
  #     render :edit
  #   end
  # end

  # def destroy
  #   @user = User.find(params[:id])
  #   # if @user == current_user
  #   @user.destroy
  #   # else
  #   # flash[:info] = "You have to be logged in to do that."
  #   # end
  #   redirect_to "/"
  # end

  # private
  # def user_params
  #   params.require(:user).permit(:user_name, :name, :address, :password)
  # end
end