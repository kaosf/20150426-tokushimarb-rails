class FollowingsController < ApplicationController
  def create
    to_user = User.find params[:following][:to_user_id]
    Following.create from_user: current_user, to_user: to_user
    redirect_to root_url
  end
end
