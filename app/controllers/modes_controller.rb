class ModesController < ApplicationController
  def index
    @modes = Mode.eager_load(:check_points)
  end

  def new
  end

  def create
  end
end
