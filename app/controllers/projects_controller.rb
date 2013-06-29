class ProjectsController < ApplicationController

  def index 
    @limit = params[:rows].nil? ? 2 : params[:rows].to_i
    @offset = params[:offset].nil? ? 0 : params[:offset].to_i

    where = ["name like '%#{params[:keyword]}%'"]
    @projects = Project.where(where.join(" AND "))
    @total = @projects.size
    @projects = @projects.limit(@limit).offset(@limit * @offset)

    if params[:partial]
      render :partial => "projects/projects"
    end
  end

  def new
    @project = Project.new
    @label = 'New Project'
    render :partial => 'form'
  end

  def edit
    @project = Project.find(params[:id])
    @label = 'Update Project'
    render :partial => 'form'
  end

  def show
    @project = Project.find(params[:id])
    session[:current_project] = @project
  end

  def create
    @project = Project.new(params[:project])
    @project.user = current_user

    if @project.save
      render :js => "window.location = '#{project_path(@project)}'", 
             :notice => 'Project was successfully created.'
    else
      render :json => {:errors => @project.errors}
    end
  end

  def update
    @project = Project.find(params[:id]) 
    if @project.update_attributes(params[:project])
      render :js => "window.location = '#{project_path(@project)}'", 
             :notice => 'Project was successfully updated.'
    else
      render :json => {:errors => @project.errors}
    end
  end

end
