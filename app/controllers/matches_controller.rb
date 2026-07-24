class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def index
    @matches = Match.order(:played_at)
  end

  def create
  end

  def show
  end

  def destroy
  end
end
