class HomeController < ApplicationController
  def index
  end
  def user_list
    @all_users = User.all
  end
end
