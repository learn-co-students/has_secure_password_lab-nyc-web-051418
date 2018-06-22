class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :authenticate!
  #
  # #helper SessionHelper
  #
  # private

  # def current_user
  #   session[:name] ||= params[:name]
  # end

  # def authenticate!
  #     redirect_to new_session_url unless (session[:user_id]).present?
  # end
end
