class HealthsController < AuthController

  before_action :check_user

  def index
  end

  def new
    @health = ::Health.new
  end

  def create
    @health = ::Health.new(health_params)
    if @health.save
      flash[:notice] = "登録しました"
      redirect_to user_works_path(user_id: @current_user.custom_url)
    else
      render :new
    end
  end

  private

  def health_params
    params.require(:health).permit(:weight, :metabolism, :muscle).tap do |v|
      v[:user_id] = @current_user.id
    end
  end
end
