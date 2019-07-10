class UsersController < ApplicationController
  # before_action :authenticate!, except: [:home, :new]
  def home
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_login_path(@users)
    else
      flash[:info] = "Something went wrong during user creation. Try again."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:info] = "Update successful! Logging you out."
      redirect_to user_path(@user)
    else
      flash[:info] = "Something went wrong. Try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    # if @user == current_user
    @user.destroy
    # else
    # flash[:info] = "You have to be logged in to do that."
    # end
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :name, :address, :password)
  end
end