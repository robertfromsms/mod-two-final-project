class RestaurantsController < ApplicationController
  # before_action :authenticate!, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
    render :index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render :show
  end

  # def new
  #   @restaurant = Restaurant.new
  #   render :new
  # end

  # def create
  #   @pet = current_user.pets.build(pet_params)
  #   if @pet.save
  #     redirect_to pet_path(@pet.id)
  #   else
  #     render :new
  #   end
  # end

  # def edit
  #   @pet = Pet.find(params[:id])
  #   render :edit
  # end

  # def update
  #   @pet = Pet.find(params[:id])
  #   @pet.update(pet_params)
  #   redirect_to pet_path(@pet.id)
  # end

  # def destroy
  #   @pet = Pet.find(params[:id])
  #   if @pet.person == current_user
  #     @pet.destroy
  #   else
  #     flash[:info] = "You are not allowed to delete other peoples pets."
  #   end
  #   redirect_to pets_path
  # end

  # private
  # def pet_params
  #   params.require(:pet).permit(:name, :image, :likes, :person_id)
  # end
end