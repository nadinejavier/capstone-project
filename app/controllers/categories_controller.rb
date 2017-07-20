class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @featured_events = Event.where(complete:false).sample(4)
  end

  def show 
    @category = Category.find(params[:id])
    @events = @category.events.where(complete: false)
  end
end
