class SessionsController < ApplicationController

  def new

  end

  def create

    user =  User.find_by(name: params[:user][:name])

    user = user.try(:authenticate, params[:user][:password])

    unless user
      return redirect_to(controller: 'sessions', action: 'new')
    end

    session[:user_id] = user.id #logged in
    return redirect_to controller: 'welcome', action: 'home'

  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
