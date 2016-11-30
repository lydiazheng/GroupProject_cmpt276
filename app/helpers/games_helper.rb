module GamesHelper
	def get_game_name(gid)
		return Game.find_by(id: gid).title

	end


end
