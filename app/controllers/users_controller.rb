class UsersController < ApplicationController

  def new #Sign up page
  end

  def create 
    user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      age: params[:age],
      password: params[:password],
      location: params[:location],
      bio: params[:bio],
      avatar: params[:avatar]
      )
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Account successfully made!"
      login(user) # logs in user
      redirect_to user_path(user) #redirects to user page
    else 
      flash[:warning] = "Invalid email or password!"
      redirect_to '/signup'
    end
  end

  def show #User's profile page
    @user = User.find(params[:id])
    @events = @user.events
    @upcoming_events = @events.where(complete: false)
    @pass_events = @events.where(complete:true)
    unless @user.id == current_user.id
      redirect_to '/'
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to '/'
    end
  end

  def update
    user = User.find(params[:id])
    user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      age: params[:age],
      password: params[:password],
      location: params[:location],
      bio: params[:bio],
      avatar: params[:avatar]
      )
    redirect_to user_path(user)
  end

end

