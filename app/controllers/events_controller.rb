class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def create
    @event = Event.create(
      title: params[:title],
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      address: params[:address],
      description: params[:description],
      )
    flash[:success] = "Event Successfully Created!"
    redirect_to events_path
  end
end
