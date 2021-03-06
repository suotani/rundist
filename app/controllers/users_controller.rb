require 'securerandom'
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "登録が完了しました。当サイトにログイン機能はございませんので、このページをブックマークしてください。"
      redirect_to user_works_path(user_id: @user.custom_url)
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :mode_id, :custom_url).tap do |v|
      v[:custom_url] = SecureRandom.hex(8)
    end
  end
end