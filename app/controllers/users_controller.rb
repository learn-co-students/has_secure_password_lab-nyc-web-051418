class UsersController < ApplicationController

  def new

  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
      unless @user.save
        return redirect_to controller: 'users', action: 'new'
      end
      session[:user_id] = @user.id #logged in
      return redirect_to controller: 'welcome', action: 'home'
    else
      flash[:notice] = "Incorrect password confirmation"
      return redirect_to controller: 'users', action: 'new'
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
