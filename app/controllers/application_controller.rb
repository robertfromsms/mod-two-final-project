class ApplicationController < ActionController::Base
	def current_user
    	user_id = session[:user_id]
    	user_id && User.find_by(id: user_id)
  end

  def current_rest
      restuser_id = session[:restuser_id]
      restuser_id && Restaurant.find_by(id: restuser_id)
  end

  def user_authenticate!
  	unless current_user
    	flash[:info] = "You have to be logged in to do that!"
    	redirect_to "/" 
  	end
  end

  def belong_to_user?(object)
    unless current_user.id == object.user.id
      flash[:info] = "You do not have permission to do that!"
      redirect_to(user_path(session[:user_id])) and return
    end
  end


  def user_self_action_permission!
    unless session[:user_id].to_s == params[:id]
          flash[:info] = "You do not have permission to do that!"
          redirect_to user_path(session[:user_id])
    end
  end

  def rest_authenticate!
    unless current_rest
      flash[:info] = "You have to be logged into your restaurant to do that!"
      redirect_to "/"
    end
  end

  def rest_self_action_permission!
    unless session[:restuser_id].to_s == params[:id]
        flash[:info] = "You do not have permission to do that!"
        redirect_to restaurant_path(session[:restuser_id])
    end
  end

  def belong_to_rest?(object)
    unless current_rest.id == object.restaurant.id
      flash[:info] = "You do not have permission to do that!"
      redirect_to(restaurant_path(session[:restuser_id])) and return
    end
  end
end
