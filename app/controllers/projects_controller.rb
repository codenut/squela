class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    respond_to do |format|
      if @project.save
        format.html {redirect_to @project, :notice => 'Project was successfully created.'}
      else
      end
    end
  end

  def update
    @project = Project.new(params[:project])
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html {redirect_to @project, :notice => 'Project was successfully updated.'}
      else
      end
    end
  end

  def new
    @project = Project.new
    render :partial => 'form'
  end

  def edit
    @project = Project.find(params[:id])
    render :partial => 'form'
  end
end
