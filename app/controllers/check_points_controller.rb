class CheckPointsController < ApplicationController
  def index
    @check_points = CheckPoint.where(mode_id: params[:id]).order(:dist)
  end

  def new
  end

  def create
  end
end
