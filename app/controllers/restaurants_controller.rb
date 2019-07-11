class RestaurantsController < ApplicationController
  before_action :rest_authenticate!, except: [:index, :show, :new, :create]
  before_action :rest_self_action_permission!, except: [:index, :show, :new, :create]

  def index
    @restaurants = Restaurant.all
    render :index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurant_menu = @restaurant.menu_items
    @current_rest = current_rest
    render :show
  end

  def new
    @restaurant = Restaurant.new
    render :new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:info] = "Restaurant registration successful. You may login now."
      redirect_to "/restaurants/login"
    else
      flash[:info] = "Something went wrong during restaurant registration. Try again."  
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    render :edit
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      flash[:info] = "Update successful! Logging you out."
      session[:restuser_id] = nil
      redirect_to "/restaurants/login"
    else
      flash[:info] = "Something went wrong. Try again."
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:info] = "We hope Delieverd can do business with your establishment in the future."
    redirect_to "/"
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:rest_name, :name, :img_url, :description, :address, :password)
  end
end