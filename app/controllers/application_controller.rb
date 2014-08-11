class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # FIXME: Server is down
  # before_filter :find_last_watched

  private

  def find_last_watched
    @last_watched = MediaServer.instance.last_watched
  end

  def require_user
    redirect_to new_user_session_path unless signed_in?
  end
end
