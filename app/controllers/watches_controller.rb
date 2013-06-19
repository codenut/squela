class WatchesController < ApplicationController
  def index
    @watches = Watch.find(:all)
    @workitem_id = params[:workitem_id]
    render :partial => 'index'
  end

  def new
    @watches = Watch.find(:all)
    @workitem_id = params[:workitem_id]
    render :partial => 'add_watches'
  end

  def create 
    @watch = Watch.new(params[:watch])
    @watch.workitem_id = params[:workitem_id]
    @watch.user_id = 1 if @watch.user_id.nil?
    @watch.save
    index
  end

  def destroy
    Watch.delete_all(["workitem_id = ? and user_id = ?", 
                     params[:workitem_id], params[:id]])
    index
  end
end
