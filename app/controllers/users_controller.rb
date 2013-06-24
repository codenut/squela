class UsersController < ApplicationController

  def index
    where = ["user_details.fullname LIKE '%#{params[:keyword]}%'"]

    @limit = params[:rows].nil? ? 2 : params[:rows].to_i
    @offset = params[:offset].nil? ? 0 : params[:offset].to_i

    @users = User.joins(:user_detail).where(where.join(" AND ")) 
    @total = @users.size

    @users = @users.offset(@offset * @limit).limit(@limit)

    if params[:partial]
      render :partial => "users/users"
    end
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
