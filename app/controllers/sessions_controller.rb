class SessionsController < ApplicationController

  before_action :require_login

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    return head(:forbidden) unless @user.authenticate(password_digest: params[:user][:password])
    session[:user_id] = @user.id

  end

  def destroy
    session.delete :name
    redirect_to '/login'
  end


  private

  def require_login
    redirect_to '/sessions/new' #if something happens
  end

end
