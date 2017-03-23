class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :following, :followers]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def avator_for
    @user = User.find(params[:id])
    send_data(@user.avatar)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'Edited your profile.'
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @users = @user.following_users
    @title = "Followings"
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
    @title = "Followers"
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :location, :bio,
                                 :password_confirmation, :avatar)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    redirect_to root_path if current_user != @user
  end
end