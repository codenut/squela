class WatchesController < ApplicationController
  def index
    @watches = Watch.find(:all)
    render :partial => 'index'
  end
end
