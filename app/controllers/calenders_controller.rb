class CalendersController < AuthController
  before_action :check_user

  def index
    @year = params[:year].blank? ? Time.zone.today.year : params[:year].to_i
    @month = params[:month].blank? ? Time.zone.today.month : params[:month].to_i
    current_month = Time.zone.parse("#{@year}-#{@month}-01")
    @works = @current_user.works
              .where(created_at: current_month..current_month.end_of_month)
              .order(:created_at)
    @end_of_month_day = @works.first.created_at.end_of_month.day
    count = 0
    days = @works.map{|w| w.created_at.day}
    first_day = @works.first.created_at
    @works = (1..@end_of_month_day).to_a.map do |d|
      if days.include?(d)
        work = @works[count]
        count +=1
        work
      else
        d
      end
    end
    @works = (["blank"] * first_day.wday).append(@works).flatten
  end
end
