class Workscontroller < ApplicationController

  before_action :check_user

  def index
  end
  
  def new
  end

  def create
    dist = params[:dist]
    cal = params[:cal]
  end


  private


  def check_user
    if session[:user_id].blank?
      user = User.find_by(room_name: params[:user_id])
      redirect_to root_path if user.blank?
      session[:user_id] = user.id
    end
  end
end