class SessionsController < ApplicationController

  def new
    render :index
  end

  def create
    user = User.find_by_credentials(
      params[:session][:email],
      params[:session][:password]
    )

    if user
      log_in_user!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
