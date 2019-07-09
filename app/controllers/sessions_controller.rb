class SessionsController < ApplicationController
  def user_new
  end

  def user_create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:info] = "Login Successful!"
      redirect_to user_path(@user)
    else
      flash[:info] = "Incorrect username or password."
      render :user_new
    end
  end

  def user_destroy
    session[:user_id] = nil
    redirect_to "/"
  end

  def restaurant_new
  end

  def restaurant_create
    @restaurant = Restaurant.find_by(rest_name: params[:rest_name])
    if @restaurant && @restaurant.authenticate(params[:password])
      session[:user_id] = @restaurant.id
      flash[:info] = "Login Successful!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:info] = "Incorrect username or password."
      render :restaurant_new
    end
  end

  def user_destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end