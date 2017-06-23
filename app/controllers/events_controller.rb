class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show 
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
    user = current_user
    @event = Event.create(
      title: params[:title],
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      address: params[:address],
      description: params[:description],
      hosted_by: user.id,
      complete: false
      )
    flash[:success] = "Event Successfully Created!"
    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
    unless current_user.id = @event.hosted_by
      redirect_to event_path(@event)
    end
  end

  def update
    event = Event.find(params[:id])
    event.update(
      title: params[:title],
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      address: params[:address],
      description: params[:description],
      )
    redirect_to event_path(event)
  end

   def destroy
    event = Event.find(params[:id])
    event.destroy
    flash[:danger] = "Event successfully deleted!"
    redirect_to "/events"
  end

end
