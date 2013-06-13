class UsersController < ApplicationController

  def index
    @users = User.find(:all, :conditions => {:is_deleted => false}) 
  end

  def new
    @user = User.new
    @label = 'New'
    render :partial => 'form' 
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render :js => "window.location = '#{user_path(@user)}'", :notice => 'User was successfully created.' 
    else
      render :json => @user.errors
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @users = User.find(:all, 
                       :select => 'id, fullname, email', 
                       :conditions => ["fullname LIKE ?", '%' + params[:keyword] + '%'])
    render :json => @users
  end
end
