class UserEventsController < ApplicationController

  def index # User's public profile page 
    @user = User.find(params[:user_id])
    @events = @user.events
  end
 
  def create 
    @user_event = UserEvent.new(
      user_id: current_user.id,
      event_id: params[:event_id])
    if @user_event.save
      flash[:success] = "You have joined!"
    else
      flash[:danger] = "Sign in to join!"
    end
  end

  def destroy
    @user_event = UserEvent.find_by(
      user_id: current_user.id,
      event_id: params[:id])
    @user_event.destroy
    flash[:info] = "You have left the event"
  end
end
