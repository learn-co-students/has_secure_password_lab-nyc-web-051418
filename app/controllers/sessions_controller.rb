class SessionsController < ApplicationController

  skip_before_action :authenticate!, :only => [:new, :create]

  def new
    @user = User.new
    @errors = []
  end

  def create
    @user = User.find_by(name: user_params[:name])

    return head(:forbidden) unless @user.authenticate(user_params[:password])
    session[:user_id] = @user.id

  end
####



  def destroy
    session.delete :name
    redirect_to '/login'
  end


  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def require_login
    redirect_to '/sessions/new' #if something happens
  end

  def authenticate!
      redirect_to new_session_url unless (session[:user_id]).present?
  end

end




    # if @user && @user.authenticate(user_params[:password])
    #   helpers.log_in_user!(@user.id)
    #   redirect_to @user
    # else
    #   @user = User.new(username: user_params[:username])
    #   @errors = ["Those credentials don't match anything we have"]
    #   render :new
    # end
