class EventsController < ApplicationController
before_action :authenticate_user!, except: [:index]
  def index
    @events = Event.all
  end

  def show 
    @current_events = Event.where(complete: false)
    if params[:id] == "random"
      @event = @current_events.sample
    else
      @event = Event.find(params[:id])
    end
    @user_event = UserEvent.find_by(
      user_id: current_user.id,
      event_id: @event.id) || UserEvent.new
  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
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
      puts @event
      params[:categories].each do |category_id|
        EventCategory.create(
          event_id: @event.id,
          category_id: category_id)
    end
    flash[:success] = "Event Successfully Created!"
    redirect_to event_path(@event)
  else
    puts @event.errors.full_messages
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
    event_categories = EventCategory.find_by(event_id: event.id)
    event_categories.destroy && event.destroy

    flash[:danger] = "Event successfully deleted!"
    redirect_to "/events"
  end



end
