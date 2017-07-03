class Api::V1::UserEventsController < ApplicationController
  def index
    @user_events = UserEvent.all
    render 'index.json.jbuilder'
  end
end
