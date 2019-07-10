class ApplicationController < ActionController::Base
	def current_user
    	user_id = session[:user_id]
    	user_id && Person.find_by(id: user_id)
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

    unless params[:id] && session[:user_id].to_s == params[:id]
        flash[:info] = "You do not have access to do that!"
        redirect_to user_path(session[:user_id])
    end
  end

  def rest_authenticate!
    unless current_rest
      flash[:info] = "You have to be logged into your restaurant to do that!"
      redirect_to "/"
    end

    unless session[:restuser_id].to_s == params[:id]
      flash[:info] = "You do not have access to do that!"
      redirect_to restaurant_path(session[:restuser_id])
    end
  end
end
