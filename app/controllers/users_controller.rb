class UsersController < ApplicationController

  def index
    @users = User.all 
  end

  def new
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
      redirect_to_users_path(user) #redirects to user page
    else 
      flash[:warning] = "Invalid email or password!"
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end

