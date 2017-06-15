class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        login(user)
        redirect_to users_path(user)
    else
      redirect_to "/login"
    end
  end


  def destroy
    logout # from SessionsHelper
    redirect_to '/login'
  end
end
