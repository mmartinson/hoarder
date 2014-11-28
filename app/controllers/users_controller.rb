class UsersController < ApplicationController

  def create
      @user = User.new user_params

      if @user.save
        sign_in @user
        redirect_to auctions_path, notice: "Welcome!"
      else
        flash.now[:alert] = "Can't create!"
        render 'sessions/new'
      end
    end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
end
