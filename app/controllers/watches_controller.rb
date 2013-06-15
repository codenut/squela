class WatchesController < ApplicationController
  def index
    @watches = Watch.find(:all)
    render :partial => 'index'
  end

  def create 
    @watch = Watch.new(params[:watch])
    @watch.save
    index
  end
end
