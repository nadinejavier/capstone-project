class UserEventsController < ApplicationController

  def index # User's public profile page 
    @user = User.find(params[:user_id])
    @events = @user.events
  end

  def create 
    @event = Event.find_by(params[:id])
    @user_event = UserEvent.create(
      user_id = current_user.id,
      event_id = @event.id)
  end
end
