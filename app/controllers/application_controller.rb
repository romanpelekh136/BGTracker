class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_player

  private

  def current_player
    @current_player ||= Player.find_by(id: session[:player_id]) if session[:player_id]
  end

  def require_login
    unless current_player
      flash[:notice] = "You need to login!"
      redirect_to login_path
    end
  end

  def redirect_if_logged_in
    if current_player
      flash[:notice] = "You already logged in!"
      redirect_to root_path
    end
  end
end
