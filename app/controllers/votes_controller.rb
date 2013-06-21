class VotesController < ApplicationController
  def index
    @votes = Vote.find(:all, :conditions => {:workitem_id => params[:workitem_id]})
    @workitem_id = params[:workitem_id]
    render :partial => 'index'
  end

  def create
    @vote = Vote.new(params[:vote])
    @vote.workitem_id = params[:workitem_id]
    @vote.save
    index
  end

  def destroy
    Vote.delete_all(["workitem_id = ? and user_id = ?",
                    params[:workitem_id], params[:id]])
    index
  end
end
