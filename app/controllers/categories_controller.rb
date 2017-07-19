class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @featured_events = Event.all.sample(3)
  end

  def show 
    @category = Category.find(params[:id])
    @events = @category.events
  end
end
