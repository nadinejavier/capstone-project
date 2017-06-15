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
      redirect_to '/'
    else 
      flash[:warning] = "Invalid email or password!"
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end

