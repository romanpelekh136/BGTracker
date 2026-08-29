class MatchesController < ApplicationController
  def new
    @match = Match.new
    @match.match_results.build
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
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  def destroy
  end

  private

  def match_params
    params.require(:match).permit(
      :board_game_id,
      :played_at,
      match_results_attributes: [ :id, :player_id, :score, :rank, :_destroy ]
      )
  end
end
