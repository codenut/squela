class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter  :current_project, :get_projects, :get_workitems

  def after_sign_in_path_for(resource_or_scope)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    sign_in_path
  end

  def current_project
    @current_project = Project.select("id").find(1)
  end

  def get_projects
    @my_projects = Project.limit(6).select("id, name").find(:all, :conditions => {:is_deleted => false})
  end

  def get_workitems
    @my_workitems = Workitem.limit(6).select("id, summary").
      find(:all, 
           :conditions => {:project_id => @current_project, 
             :is_deleted => false})
  end
end
