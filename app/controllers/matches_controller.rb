class MatchesController < ApplicationController
  def new
    @match = Match.new
    @match.match_results.build
    @board_games = BoardGame.order(:title)
    @players = Player.order(:username)
  end

  def index
    @pagy, @matches = pagy(
      :offset,
      Match.includes(:board_game, match_results: :player).order(played_at: :desc),
      limit: 5
    )
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to @match, notice: "Match saved successfully."
    else
      @board_games = BoardGame.order(:title)
      @players = Player.order(:username)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @match = Match.includes(:board_game, match_results: :player).find(params[:id])
  end

  def destroy
  end

  private

  def match_params
    params.require(:match).permit(
      :board_game_id,
      :played_at,
      match_results_attributes: [ :id, :player_id, :score, :rank ]
      )
  end
end
