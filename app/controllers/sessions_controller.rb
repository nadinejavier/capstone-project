class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        login(user)
        redirect_to user_path(user)
    else
      flash[:danger] = "Invalid username or password."
      redirect_to "/login"
    end
  end


  def destroy
    logout # from SessionsHelper
    flash[:success] = "You have logged out"
    redirect_to '/'
  end
end
