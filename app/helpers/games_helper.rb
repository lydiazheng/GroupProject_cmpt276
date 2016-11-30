module GamesHelper
	def get_game_name(gid)
		return Game.find_by(id: gid).title
	end

	def get_game_address(g_address)
		return Game.find_by(id: g_address).address
	end

	def get_game_duration(g_duration)
		return Game.find_by(id: g_duration).duration
	end
end
