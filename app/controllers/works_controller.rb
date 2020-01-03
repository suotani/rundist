class WorksController < AuthController

  before_action :check_user

  def index
    @total_dist = @current_user.works.sum(:dist)
    @total_cal = @current_user.works.sum(:cal)
    @work = @current_user.works
              .where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
              .first
    @work = Work.new(dist: 0,cal: 0) unless @work.present?
    @check_point = @current_user.mode.check_points.where("dist < ?", @current_user.total_dist).order(:dist).last
    @next_check_point = @current_user.mode.check_points.where("dist > ?", @current_user.total_dist).order(:dist).first
    @next_check_point_dist = @next_check_point.dist.to_f - @current_user.total_dist if @next_check_point

    @healths = @current_user.healths
              .where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
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

end