class PlayersController < ApplicationController

  def index
    @competition = Competition.find(params[:competition_id])
    @players = Player.all
    @game = Game.find(params[:game_id])
  end

  def new
    @game = Game.find(params[:game_id]) #(replace '1' with :game_id)
    @player = @game.players.new
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id]) #(replace '1' with :game_id)
    i = 1
      24.times do
        @player = @game.players.create(name: params["player"]["player#{i}"]) # this was an issue
        i += 1
      end
    redirect_to competition_game_player_url(@competition.id, @game.id, @player.id)
  end

  def show
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id])
    @players = Player.all.select { |player| player.game_id == @game.id }
  end

  private

  def player_params
    params.require(:player).permit(:name) ####### there's an issue here.
  end
  
end
