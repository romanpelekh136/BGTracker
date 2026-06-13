class SessionsController < ApplicationController
  before_action :redirect_if_logged_in

  def new
  end

  def create
    player = Player.find_by(username: params[:username])

    if player && player.authenticate(params[:password])
      session[:player_id] = player.id
      redirect_to root_path
    else
      flash[:alert] = "Wrong combination of username and password!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end
end
