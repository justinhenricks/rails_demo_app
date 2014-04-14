class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @wallpost = current_user.wallposts.build if signed_in?
    @wallposts = @user.wallposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_user_params)
    if @user.save
      flash[:success] = "Welcome to the demo rails app for my presentation!"
      sign_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  # Before filtera
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  private

  def strong_user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
