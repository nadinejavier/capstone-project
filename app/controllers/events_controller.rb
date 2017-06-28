class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show 
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    user = current_user
    @event = Event.new(
      title: params[:title],
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      address: params[:address],
      description: params[:description],
      hosted_by: user.id,
      complete: false
      )
    if @event.save
      params[:categories].each do |category_id|
        EventCategory.create(
          event_id = @event.id,
          category_id = category_id)
    end
    flash[:success] = "Event Successfully Created!"
    redirect_to event_path(@event)
  else
    @categories = Category.all
    render :new
  end
  end

  def edit
    @event = Event.find(params[:id])
    @categories = Category.all
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
