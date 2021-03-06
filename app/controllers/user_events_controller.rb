class UserEventsController < ApplicationController

  def index # User's public profile page 
    @event = Event.find(params[:event_id])
    @users = @event.users
  end
 
  def create 
    @user_event = UserEvent.new(
      user_id: current_user.id,
      event_id: params[:event_id])
    if @user_event.save
      flash[:success] = "You have joined!"
      redirect_to "/events/#{params[:event_id]}"
    else
      flash[:danger] = "Sign in to join!"
    end
  end

  def show 
    user_events = Event.where(id: params[:event_id])
    @user = user_events.where(user_id: params[:user_id])
    if params[:id] == "random"
     event = user_events.sample
     users = event.users - [current_user]
     @user = users.sample
     end
  end

  def destroy
    @user_event = UserEvent.find_by(
      user_id: current_user.id,
      event_id: params[:event_id])
    @user_event.destroy
    flash[:info] = "You have left the event"
    redirect_to "/events/#{params[:event_id]}"
  end


end
