class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

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
    @game.destroy
    flash[:success] = 'Game was successfully destroyed.'
    redirect_to games_url 
  end

  def add_histories
    @game = Game.new
    @user = params[:user_id]
    @location = params[:location]
    @hint1 = params[:hint1_used]
    @hint2 = params[:hint2_used]
    
    @location.update_attribute(:user_id, current_user.id)
    @location.update_attribute(:timestamp, DateTime.now.in_time_zone("Pacific Time (US & Canada)"))


    redirect_to controller: 'users', action: 'show', id: @current_user.id
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params[:game].permit(:title,:duration,:starts_at_date,:starts_at_time,:latitude,:longitude, location_ids: [])
    end
end
