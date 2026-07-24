class BoardGamesController < ApplicationController
  before_action :find_board_game, only: [ :show, :destroy ]

  def new
    @board_game = BoardGame.new
  end

  def create
    @board_game = BoardGame.new(board_games_params)
    if @board_game.save
      flash[:notice] = "Successfully created"
      redirect_to @board_game
    else
      flash[:alert] = @board_game.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @board_games = BoardGame.order(:title)
  end

  def destroy
  end

  def show
  end

  private

  def find_board_game
    @board_game = BoardGame.find(params[:id])
  end

  def board_games_params
    params.require(:board_game).permit(:title, :description, :min_players, :max_players)
  end
end
