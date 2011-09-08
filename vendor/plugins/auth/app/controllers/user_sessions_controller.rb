class UserSessionsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
    #require 'ruby-debug' ; Debugger.start
    #debugger
    #puts logged_in?.inspect
    @user_session = UserSession.new
    #redirect_to :controller => "backend" if logged_in?
  end

  def create
    #require 'ruby-debug' ; Debugger.start
    #debugger
    #puts '#############'
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Logged in successfully."
      redirect_to_target_or_default(root_path)
    else
      flash[:error] = "Login incorrect. Please try again."
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end
end
