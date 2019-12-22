class AuthController < ApplicationController

  def check_user
    if session[:user_id].blank?
      user = User.find_by(custom_url: params[:user_id])
      redirect_to root_path if user.blank?
      session[:user_id] = user.id
      @current_user = user
    end
  end
end