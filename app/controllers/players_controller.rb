class PlayersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @game = Game.find(1) #(replace '1' with :game_id)
    @player = @game.players.create(player_params)
  end

  private

  def player_params
    params.require(:name)
  end
end
