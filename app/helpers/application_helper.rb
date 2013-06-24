module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
    @resource.user_detail = @resource.build_user_detail
    @resource
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def after_sign_in_path_for(resource_or_scope)
    session[:previous_url] || root_path
  end

  def date_to_s(date) 
    date.strftime("%B %d, %Y %I:%M %p") 
  end
end
