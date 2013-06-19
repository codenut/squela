class WorkitemsController < ApplicationController

  def index
    @workitems = Workitem.find(:all, 
                               :conditions => {:is_deleted => false})
  end

  def new 
    @workitem = Workitem.new
    render 'new'
  end

  def create
    @workitem = Workitem.new(params[:workitem])
    @workitem.user_id = 1

    if @workitem.save
      Vote.create(:user_id => @workitem.user_id, 
                   :workitem_id => @workitem.id)
      render :js => "window.location = '#{workitem_path(@workitem)}'", 
             :notice => 'Workitem was successfully created.'
    else
      render :json => {'errors' => @workitem.errors}
    end
  end

  def update
    @workitem = Workitem.find(params[:id])
    if @workitem.update_attributes(params[:workitem])
      render :js => "window.location = '#{workitem_path(@workitem)}'", 
             :notice => 'Workitem was successfully created.'
    else
      render :json => {'errors' => @workitem.errors}
    end
  end

  def show
    @workitem = Workitem.find(params[:id])
    render 'new'
  end
end
