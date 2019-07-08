class UsersController < ApplicationController
  def home
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:info] = "Something went wrong. Try again."
      render :edit
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :name, :address, :password)
  end
end