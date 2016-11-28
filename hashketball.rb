def game_hash 
{
	:home => {
		:team_name => "Brooklyn Nets",
		:colors => ["Black", "White"],
		:players => {
			"Alan Anderson" => {
				:number => 0,
				:shoe => 16,
				:points => 22,
				:rebounds => 12,
				:assists => 12,
				:steals => 3,
				:blocks => 1,
				:slam_dunks => 1
			},
			"Reggie Evans" => {
				:number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
			},
			"Brook Lopez" => {
				:number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
			},
			"Mason Plumlee" => {
				:number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
			},
			"Jason Terry" => {
				:number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
			}
		}
	},
	:away => {
		:team_name => "Charlotte Hornets",
		:colors => ["Turquoise", "Purple"],
		:players => {
			"Jeff Adrien" => {
				:number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
			},
			"Bismak Biyombo" => {
				:number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
			},
			"DeSagna Diop" => {
				:number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
			},
			"Ben Gordon" => {
				:number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
			},
			"Brendan Haywood" => {
				:number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
		}
	}
}
end

def player_stat(player, stat)
	player_stat = nil
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :players
				data.each do |player_name, player_stats|
					if player_name == player
						player_stat = player_stats[stat]
					end
				end
			end
		end
	end
	player_stat
end

def num_points_scored(player)
	player_stat(player, :points)
end

def shoe_size(player)
	player_stat(player, :shoe)
end

def team_colors(team)
	team_colors = nil
	game_hash.each do |location, team_data|
		if team_data[:team_name] == team
			team_colors = team_data[:colors]
		end
	end
	team_colors
end

def team_names
	team_names = []
	game_hash.each do |location, team_data|
		team_names << team_data[:team_name]
	end
	team_names
end

def player_numbers(team)
	player_numbers = []
	game_hash.each do |location, team_data|
		if team_data[:team_name] == team
			team_data[:players].each do |player, stats|
				player_numbers << stats[:number]
			end
		end
	end
	player_numbers
end

def player_stats(player)
	stats = nil
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :players
				data.each do |player_name, player_stats|
					if player_name == player
						stats = player_stats
					end
				end
			end
		end
	end
	stats
end

def big_shoe_rebounds
	player_shoe_sizes = {}
	players.each do |player|
		player_shoe_sizes[player] = player_stat(player, :shoe)
	end
	big_shoe_player = player_shoe_sizes.max_by{|player, shoe_size| shoe_size}.first
	player_stat(big_shoe_player, :rebounds)
end

def players
	all_players = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :players
				data.each do |players, stats|
					all_players << players
				end
			end
		end
	end
	all_players
end

def most_points_scored
	player_points = {}
	players.each do |player|
		player_points[player] = player_stat(player, :points)
	end
	player_points.max_by{|player, points| points}.first
end

def winning_team
	home_team = game_hash[:home][:team_name]
	away_team = game_hash[:away][:team_name]

	if team_points(home_team) > team_points(away_team)
		home_team
	else
		away_team
	end
end

def team_points(team_name)
	points = 0
	game_hash.each do |location, team_data|
		if team_data[:team_name] == team_name
			team_data.each do |attribute, data|
				if attribute == :players
					data.each do |player_name, player_stats|
						points += player_stats[:points]
					end
				end
			end
		end
	end
	points
end

def player_with_longest_name
	players.max{|player| player.length}
end

def most_steals
	player_steals = {}
	players.each do |player|
		player_steals[player] = player_stat(player, :steals)
	end
	player_steals.max_by{|player, steals| steals}.first
end

def long_name_steals_a_ton?
	if player_with_longest_name == most_steals
		true
	else
		false
	end
end










