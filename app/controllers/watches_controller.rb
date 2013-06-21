class WatchesController < ApplicationController
  def index
    @watches = Watch.find(:all, :conditions => {:workitem_id => params[:workitem_id]})
    @workitem_id = params[:workitem_id]
    render :partial => 'index'
  end

  def new
    @watches = Watch.find(:all, :conditions => {:workitem_id => params[:workitem_id]})
    @workitem_id = params[:workitem_id]
    render :partial => 'add_watches'
  end

  def create 
    @watch = Watch.new(params[:watch])
    @watch.workitem_id = params[:workitem_id]
    @watch.save
    index
  end

  def destroy
    Watch.delete_all(["workitem_id = ? and user_id = ?", 
                     params[:workitem_id], params[:id]])
    index
  end
end
