class MenuItemsController < ApplicationController
  before_action :rest_authenticate!

  def new
    @menuitem = MenuItem.new
    render :new
  end

  def create
    @menuitem = MenuItem.new(menuitem_params)
    @menuitem.restaurant_id = current_rest.id
    if @menuitem.save
      flash[:info] = "Menu item added!"
      redirect_to restaurant_path(current_rest)
    else
      flash[:info] = "Something went wrong while adding the menu item. Try again."  
      render :new
    end
  end

  def edit
    @menuitem = MenuItem.find(params[:id])
    belong_to_rest?(@menuitem)
  end

  def update
    @menuitem = MenuItem.find(params[:id])
    belong_to_rest?(@menuitem)
    if @menuitem.update(menuitem_params)
      flash[:info] = "Menu item updated!"
      redirect_to restaurant_path(current_rest)
    else
      flash[:info] = "Something went wrong. Try again."
      render :edit
    end
  end

  def destroy
    @menuitem = MenuItem.find(params[:id])
    belong_to_rest?(@menuitem)
    @menuitem.destroy
    flash[:info] = "Menu item deleted."
    redirect_to restaurant_path(current_rest)
  end

  private
  def menuitem_params
    params.require(:menu_item).permit(:name, :img_url, :description, :price)
  end
end