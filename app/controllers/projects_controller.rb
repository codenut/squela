class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def index 
    @projects = Project.find(:all, :conditions => {:is_deleted => false})
  end

  def create
    @project = Project.new(params[:project])
    puts 'add'
    if @project.save
      render :js => "window.location = '#{project_path(@project)}'", :notice => 'Project was successfully created.'
    else
      render :json => @project.errors
    end
  end

  def update
    @project = Project.find(params[:id]) 
    puts "update #{@project.id} #{@project.name}"
    if @project.update_attributes(params[:project])
      render :js => "window.location = '#{project_path(@project)}'", :notice => 'Project was successfully updated.'
    else
      render :json => @project.errors
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
end
