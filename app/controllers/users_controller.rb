class UsersController < ApplicationController
  include GamesHelper
  #prevent an user from editting other users' profile
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  #prevent any user other than admin from viewing all users and destroy
  before_action :admin_user,     only: [:index, :destroy]

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Urban Hunt!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    # when user click leave game bottom, it will execute the if statement and destroy the record in
    # play table
    if (params[:gid] && params[:leave] && (Play.find_by(:user_id => current_user.id, :game_id => params[:gid])))
      (Play.find_by(:user_id => current_user.id, :game_id => params[:gid])).destroy

      redirect_to games_path
    #else if game id is passed and if not joined the game
    elsif(params[:gid] && !(Play.find_by(:user_id => current_user.id, :game_id => params[:gid])))
      Play.create(:user_id => current_user.id, :game_id => params[:gid], :points => 0)
      redirect_to games_path
    end

    @organized_games = Game.where(organizer_id:current_user.id)

    joined_plays = Play.where(user_id:current_user.id)
    @upcoming_games = []
    @past_games = []
    joined_plays.each do |g|
      game = Game.find(g.game_id)
      if get_game_end_datetime(g.game_id) >= DateTime.now
        @upcoming_games.push(game)
      else
        @past_games.push(game)
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Delete successfully!"
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:username, :firstname, :lastname, :email, :password,
                                   :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.is_admin?
    end

end
