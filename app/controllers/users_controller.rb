class UsersController < ApplicationController
 # before_action :authenticate_user!
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
      bio: params[:bio]
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
    # if current_user.id = @user.id
    #   render "show.html.erb"
    # else
    #   redirect_to '/'
    # end
  end

  def edit
    @user = User.find(params[:id])
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
      bio: params[:bio]
      )
    redirect_to user_path(user)
  end

end

