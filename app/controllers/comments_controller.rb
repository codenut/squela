class CommentsController < ApplicationController
  def index
    @comments = Comment.find(:all, :conditions => {:is_deleted => false})
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = 1
    if @comment.save
      render :partial => 'comment'
    else
      render :json => @comment.errors
    end
  end
end
