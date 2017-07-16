class CommentsController < ApplicationController

  def create
    comment = Comment.new(
      user_id: current_user.id,
      event_id: params[:event_id],
      body: params[:body])
    if comment.save
      flash[:success] = "Comment Successfully Added."
      redirect_to :back 
    else
      flash[:danger] = "Something Went Wrong!"
      redirect_to :back 
    end
  end


end
