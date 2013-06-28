class WorkitemsController < ApplicationController

  def index
    where = ["summary LIKE '%#{params[:keyword]}%'", "project_id = #{params[:project_id]}"]

    %w(type_id status_id).each do |value|
      if !params[value].blank?
        where << "#{value} = #{params[value]}"
      end
    end

    where << "is_deleted = 0"

    @limit = params[:rows].nil? ? 2 : params[:rows].to_i
    @offset = params[:offset].nil? ? 0 : params[:offset].to_i

    @workitems = Workitem.where(where.join(" AND "))
    @total = @workitems.size
    @workitems = @workitems.offset(@offset * @limit).limit(@limit)

    if params[:partial]
      render :partial => "workitems"
    end
  end

  def new 
    @workitem = Workitem.new
    render 'show' 
  end

  def create
    @workitem = Workitem.new(params[:workitem])
    @workitem.project_id = params[:project_id]
    @workitem.user_id = current_user.id

    if @workitem.save
      Vote.create(:user_id => @workitem.user_id, 
                  :workitem_id => @workitem.id)
      render :js => "window.location = '#{project_workitem_path(@current_project, @workitem)}'", 
        :notice => 'Workitem was successfully created.'
    else
      render :json => {'errors' => @workitem.errors}
    end
  end

  def update
    @workitem = Workitem.find(params[:id])
    if @workitem.update_attributes(params[:workitem])
      render :js => "window.location = '#{project_workitem_path(@current_project, @workitem)}'", 
        :notice => 'Workitem was successfully created.'
    else
      render :json => {:errors => @workitem.errors}
    end
  end

  def show
    @workitem = Workitem.find(params[:id])
    @types = WorkitemType.all_cached
    render 'show'
  end
end
