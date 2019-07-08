class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    # @person.pets.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:info] = "Something went wrong. Try again."
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :name, :address, :password)
  end
end