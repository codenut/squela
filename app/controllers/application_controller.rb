class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :current_project, :get_projects, :get_workitems, :set_current_user

  def current_project
    if session[:current_project].nil? and current_user
      @current_project = Project.limit(1).select("id, name").where(:user_id => current_user)[0] 
      session[:current_project] = @current_project
    else
      @current_project = session[:current_project]
    end
  end

  def get_projects
    @my_projects = Project.limit(6).
      select("id, name").
      where(["is_deleted = 0 and id != #{(@current_project.nil? ? 0 : @current_project.id)}"])
  end

  def get_workitems
    @my_workitems = Workitem.limit(6).
      select("id, summary").
      find(:all, :conditions => {:project_id => @current_project, :is_deleted => false})
  end

  def set_current_user
    User.current_user = current_user
  end

  protected

  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end

end
