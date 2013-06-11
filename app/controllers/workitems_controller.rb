class WorkitemsController < ApplicationController

  def index
    respond_to do |format|
      format.html
    end
  end

  def new 
    @workitem = Workitem.new
    render 'view'
  end

  def view
    @workitem = Workitem.find(1)
    puts @workitem.comments
    respond_to do |format|
      format.html
    end
  end
end
