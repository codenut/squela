class UsersController < ApplicationController

  def index
    @users = User.find(:all, :conditions => {:is_deleted => false}) 
  end

  def new
    @user = User.new
    @user_detail = @user.build_user_detail
    @label = 'New'
    render :partial => 'form' 
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render :js => "window.location = '#{user_path(@user)}'", :notice => 'User was successfully created.' 
    else
      render :json => @user.errors
    end
  end

  def search
    @users = User.search_user_watch(params[:workitem_id], params[:q])
    render :json => @users
  end
end
