class GamesController < ApplicationController
  include GamesHelper
  before_action :set_game, only: [:show, :edit, :update, :destroy, :play]

  #Only allow joined users to play game
  before_action :is_joined, only: [:play, :start]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
  end

  # GET /games/new
  def new
    @locations = Location.all
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new(game_params)
    @game.organizer = current_user
    if @game.save
      flash[:success] = 'Game was successfully created.'
      redirect_to @game
    else
      render :new
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      flash[:success] = 'Game was successfully updated.'
      redirect_to @game
    else
      render :edit
    end
  end

  # DELETE /games/1
  def destroy
    Game.find(params[:id]).destroy
    flash[:success] = 'Game was successfully destroyed.'
    redirect_to games_url
  end

  # GET /games/play/1
  def play
    @game_start_datetime = get_game_start_datetime(params[:id])
    @game_end_datetime = get_game_end_datetime(params[:id])
    @user_game_history = GameHistory.find_by(:user_id => current_user.id, :game_id => params[:id])
  end

  def start
    game_id = params[:id]
    game = Game.find(game_id)
    game_start_datetime = get_game_start_datetime(game_id)
    game_end_datetime = get_game_end_datetime(game_id)
    if game_start_datetime <= DateTime.now && game_end_datetime >= DateTime.now
      game.locations.all.each do |loc|
        GameHistory.create(user_id:current_user.id, game_id:game_id,
                           location_id:loc.id, discovered:false,
                           hint1_used:false, hint2_used:false)

      end
      flash[:success] = 'Game Started'
    else
      flash[:fail] = 'Game cannot start, please makes sure you are playing the game at the correct time'
    end
    redirect_to controller: 'games', action: 'play', id:game_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    def is_joined
      if (logged_in? && Play.find_by(:user_id => current_user.id, :game_id => params[:id]))
        return true
      end
      redirect_to games_url
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params[:game].permit(:title,:duration,:starts_at_date,:starts_at_time,:latitude,:longitude, location_ids: [])
    end
end
