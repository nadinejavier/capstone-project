class EventsController < ApplicationController
before_action :authenticate_user!, except: [:index]
  def index
    @events = Event.where(complete: false)
  end

  def show 
    @current_events = Event.where(complete: false)

    if params[:id] == "random"
      @event = @current_events.sample
    elsif params[:id] == "attendees"
      render 'attendees.html.erb'
    else
      @event = Event.find(params[:id])
    end
    @host = User.find_by(id: @event.hosted_by)
    @categories = @event.categories
    @random_event = @categories.first.events.sample
    @user_event = UserEvent.find_by(
      user_id: current_user.id,
      event_id: @event.id) || UserEvent.new
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
      complete: false,
      avatar: params[:avatar]
      )
    if @event.save
      puts @event
      params[:category_ids].each do |category_id|
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
    if event.update(
      title: params[:title],
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      address: params[:address],
      description: params[:description],
      complete: params[:complete],
      avatar: params[:avatar]
      )
     event.categories.destroy_all
      params[:category_ids].each do |category_id|
        EventCategory.create(
          event_id: event.id,
          category_id: category_id
        )
        end
        flash[:success] = "Event successfully updated"
    redirect_to event_path(event)
    else 
      @categories = Category.all
      flash[:danger] = "Something went wrong, please check your fields."
      render :edit
    end
  end

   def destroy
    event = Event.find(params[:id])
    event_categories = EventCategory.find_by(event_id: event.id)
    user_events = UserEvent.find_by(event_id: event.id)
    user_events.destroy && event_categories.destroy && event.destroy

    flash[:danger] = "Event successfully deleted!"
    redirect_to "/events"
  end



end
