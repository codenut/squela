class WatchesController < ApplicationController
  def index
    @watches = Watch.find(:all)
    render :partial => 'index'
  end

  def create 
    @watch = Watch.new(params[:watch])
    @watch.workitem_id = params[:workitem_id]
    @watch.user_id = 1 if @watch.user_id.nil?
    @watch.save
    index
  end

  def destroy
    @watch = Watch.find(params[:id])
    @watch.destroy
    index
  end
end
