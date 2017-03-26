class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers, :favorites]
  before_action :correct_user, only: [:edit, :update]

  def show
    @title = 'Micropost'
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
    @users = @user.following_users
    @title = "Followings"
    render 'show_follow'
  end

  def followers
    @users = @user.follower_users
    @title = "Followers"
    render 'show_follow'
  end
  
  def favorites
    @title = 'Favorites'
    @microposts = @user.favorite_microposts
    render 'show'
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