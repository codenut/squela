class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    @user_detail = @user.build_user_detail
    @label = 'New'
    render :partial => 'users/form'
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      if current_user.nil?
        sign_in @user
        render :js => "window.location = '#{root_path}'", :notice => 'Welcome.' 
      else
        render :js => "window.location = '#{user_path(@user)}'", :notice => 'User was successfully created.' 
      end
    else
      render :json => { :errors => @user.errors }
    end
  end

end
