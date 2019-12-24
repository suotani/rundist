class CheckPointsController < ApplicationController
  def index
    @check_points = CheckPoint.where(mode_id: params[:id]).order(:dist)
  end

  def new
    @check_points = CheckPoint.where(mode_id: params[:id]).order(:dist).to_a
    5.times do |i|
      @check_points.append(CheckPoint.new(mode_id: params[:id]))
    end
  end

  def create
    @check_points = params[:check_points].map do |v|
      cp = CheckPoint.new(
        mode_id: v[:mode_id],
        start_point: v[:start_point],
        dist: v[:dist]
      )
      next if cp.start_point.blank? || cp.dist.blank?
      cp
    end
    @check_points.compact!
    p @check_points
    ActiveRecord::Base.transaction do
      CheckPoint.where(mode_id: params[:id]).destroy_all
      CheckPoint.import! @check_points
    end
      redirect_to  new_check_point_path(id: Mode.take.id)
  rescue ActiveRecord::RecordInvalid
      render "new"
  end



end
