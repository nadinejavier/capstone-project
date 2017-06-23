class UserEventsController < ApplicationController

  def index # User's public profile page 
    @user = User.find(params[:user_id])
    @events = @user.events
  end
end
