class MatchesController < ApplicationController
  def new
    @match = Match.new
    6.times { @match.match_results.build }
  end

  def index
    @matches = Match.order(:played_at)
  end

  def create
  end

  def show
    @match = Match.find(params[:id])
  end

  def destroy
  end
end
