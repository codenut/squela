class UsersController < ApplicationController

  def index
    @users = User.find(:all, :conditions => {:is_deleted => false}) 
  end

  def new
    @user = User.new
    @user_detail = @user.user_detail.build
    @label = 'New'
    render :partial => 'form' 
  end

  def create
    @user = User.new(params[:user])
    head :ok 
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
    @users = User.search_user_watch(params[:workitem_id], params[:q])
    render :json => @users
  end
end
