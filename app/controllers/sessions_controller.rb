class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by_username params[:username]
    if user && user.authenticate params[:password]
      sign_in user
      redirect_to auctions_path, notice: "Welcome back #{user.username}"
    else
      redirect_to new_session_path,
         alert: "Problem signing in, try again or sign up for a new account"
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
