class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        login(user)
        flash[:success] = "Welcome back #{user.first_name}!"
        redirect_to user_path(user)
    else
      flash[:danger] = "Invalid username or password."
      redirect_to "/login"
    end
  end


  def destroy
    logout # from SessionsHelper
    redirect_to '/login'
  end
end
