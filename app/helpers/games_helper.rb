module GamesHelper
  def get_game_start_datetime(gid)
    game = Game.find(gid)
    start_dt = Time.zone.local(game.starts_at_date.year,
                            game.starts_at_date.month,
                            game.starts_at_date.day,
                            game.starts_at_time.hour,
                            game.starts_at_time.min,
                            game.starts_at_time.sec)
    return start_dt
  end

  def get_game_end_datetime(gid)
    game = Game.find(gid)
    start_dt = get_game_start_datetime(gid)
    end_dt = start_dt + game.duration.minutes
    return end_dt
  end
end
