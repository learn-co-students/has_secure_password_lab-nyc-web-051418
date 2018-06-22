class UsersController < ApplicationController

  def new
  end

  def create


      @user = User.new(user_params)
      if @user.blank?
        redirect_to '/sessions/new'
      else
        @user.save
        session[:user_id] = @user.id #this is what logs user in
        redirect_to '/users/new'
      end

  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password, :password_confirmation)
  end

end
