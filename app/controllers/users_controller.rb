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
    user_ids = [0]
    watches = Watch.where(["workitem_id = ?", params[:workitem_id]]).select("user_id")
    for watch in watches
      user_ids << watch[:user_id]
    end
    @users = User.where(["fullname like ? and id not in (?)", 
                          "%#{params[:keyword]}%", user_ids]).
                          select("id, fullname, email")
    render :json => @users
  end
end
