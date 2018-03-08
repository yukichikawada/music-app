class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def new
    render :new
  end

  def create
    @user = User.create(user_params)

    if @user.save!
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Sign up failed!"]
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
