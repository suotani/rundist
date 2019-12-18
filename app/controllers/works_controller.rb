class WorksController < ApplicationController

  before_action :check_user

  def index
    @total_dist = @current_user.works.sum(:dist)
    @total_cal = @current_user.works.sum(:cal)
    @work = @current_user.works
              .where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
              .first
    @work = Work.new(dist: 0,cal: 0) unless @work.present?
  end
  
  def new
    @sw = ::SubWork.new(0,0)
  end

  def create
    dist = params[:dist]
    cal = params[:cal]
    @sw = ::SubWork.new(params[:dist], params[:cal])
    work = @current_user.works
               .where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
               .first
    work = Work.new(dist: 0, cal: 0, user_id: @current_user.id) unless work.present?
    if @sw.save(work)
      flash[:notice] = "登録しました"
      redirect_to user_works_path(user_id: @current_user.custom_url)
    else
      render :new
    end
  end


  private


  def check_user
    if session[:user_id].blank?
      user = User.find_by(custom_url: params[:user_id])
      redirect_to root_path if user.blank?
      session[:user_id] = user.id
      @current_user = user
    end
  end
end