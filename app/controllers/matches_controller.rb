class MatchesController < ApplicationController
  def new
    @match = Match.new
    6.times { @match.match_results.build }
  end

  def index
    @matches = Match.order(:played_at)
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to @match
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
      match_results_attributes: [ :player_id, :score, :rank ]
    )
  end
end
