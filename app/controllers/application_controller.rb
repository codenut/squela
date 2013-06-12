class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_projects
  before_filter :get_workitems

  def get_projects
    @my_projects = Project.limit(6).find(:all, :conditions => {:is_deleted => false})
  end

  def get_workitems
    @my_workitems = Workitem.limit(6).find(:all, :conditions => {:is_deleted => false})
  end
end
