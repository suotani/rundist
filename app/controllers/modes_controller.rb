class ModesController < ApplicationController
  def index
    @modes = Mode.all
  end

  def new
  end

  def create
  end
end
