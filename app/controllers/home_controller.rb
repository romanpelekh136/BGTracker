class HomeController < ApplicationController
  before_action :require_login
  def index
    @matches = Match.includes(:board_game, match_results: :player)
      .order(created_at: :desc)
      .limit(10)
  end
end
