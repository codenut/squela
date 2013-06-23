class Devise::RegistrationsController < Devise::RegistrationsController
  respond_to :json, :js

  def create
    @user = User.new(params[:user])
    if @user.save
      render :js => "window.location = '#{user_path(@user)}'", :notice => 'User was successfully created.' 
    else
      render :json => @user.errors
    end
  end
end
