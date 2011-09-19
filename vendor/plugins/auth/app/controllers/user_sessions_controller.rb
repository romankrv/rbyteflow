class UserSessionsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
    #redirect_to_target_or_default(root_path) if logged_in?
  end

  def create
    user = User.find_by_username(params[:user_session][:username])
    if user && user.valid_password?(params[:user_session][:password])
      session[:current_user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_to_target_or_default(root_path)
    else
      flash[:error] = "Login incorrect. Please try again."
      render :action => 'new'
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end
end
