class ApplicationController < ActionController::Base


  protected

  def check_user
    if session[:user_id].blank?
      user = User.find_by(room_name: params[:name])
      redirect_to root_path if user.blank?
      session[:user_id] = user.id
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
