class RestaurantsController < ApplicationController
  # before_action :authenticate!, except: [:index, :show, :new]

  def index
    @restaurants = Restaurant.all
    render :index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render :show
  end

  def new
    @restaurant = Restaurant.new
    render :new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      flash[:info] = "Something went wrong during user creation. Try again."  
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
      flash[:info] = "Update successful!"
      redirect_to pet_path(@pet.id)
    else
      flash[:info] = "Something went wrong. Try again."
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
  #   if @pet.person == current_user
    @restaurant.destroy
  #   else
  #     flash[:info] = "You are not allowed to delete other peoples pets."
  #   end
    redirect_to "/"
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:rest_name, :name, :address, :password)
  end
end