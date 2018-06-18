class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user

  def logged_in?
    current_user.id != nil
  end

  def require_logged_in?

    unless logged_in?
      return redirect_to controller: 'sessions', action: 'new'
    end

  end

  def current_user #find user or return a new one
    @user = User.find_by(id: session[:user_id]) || User.new
  end

end
