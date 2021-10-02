class HomeController < ApplicationController
  def index
  end
  def user_list
    @user = User.find_by_id(params[:id])
  end
  def all_users
    @users = User.all
  end
end
