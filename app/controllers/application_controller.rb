class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def is_user?
    if params[:user_id] != current_user
      redirect_to "/"
    end
  end

  include SessionsHelper 
end
