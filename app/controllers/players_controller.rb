class PlayersController < ApplicationController
  before_action :redirect_if_logged_in, only: [ :new, :create ]

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to login_path
    else
      flash.now[:alert] = @player.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.require(:player).permit(:username, :password)
  end
end
