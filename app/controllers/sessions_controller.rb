class SessionsController < ApplicationController

  before_action :require_login

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    session[:user_id] = @user.id if @user.try(:authenticate, params[:user][:password_digest])

  #   else
  #     redirect_to '/sessions/new'
  #   #return head(:forbidden) unless user_authentication_result
  # end



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
