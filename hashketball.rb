require 'pry'

def game_hash
	game = {
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: {
				"Alan Anderson" => {
					number: 0,
					shoe: 16,
					points: 22,
					rebounds: 12,
					assists: 12,
					steals: 3,
					blocks: 1,
					slam_dunks: 1,
				},
				"Reggie Evans" => {
					number: 30,
					shoe: 14,
					points: 12,
					rebounds: 12,
					assists: 12,
					steals: 12,
					blocks: 12,
					slam_dunks: 7,
				},
				"Brook Lopez" => {
					number: 11,
					shoe: 17,
					points: 17,
					rebounds: 19,
					assists: 10,
					steals: 3,
					blocks: 1,
					slam_dunks: 15,
				},
				"Mason Plumlee" => {
					number: 1,
					shoe: 19,
					points: 26,
					rebounds: 12,
					assists: 6,
					steals: 3,
					blocks: 8,
					slam_dunks: 5,
				},
				"Jason Terry" => {
					number: 31,
					shoe: 15,
					points: 19,
					rebounds: 2,
					assists: 2,
					steals: 4,
					blocks: 11,
					slam_dunks: 1,
				}
			}
		},
		away: {
			team_name: "Charlotte Hornets",
			colors: ["Turquoise", "Purple"], 
			players: {
				"Jeff Adrien" => {
					number: 4,
					shoe: 18,
					points: 10,
					rebounds: 1,
					assists: 1,
					steals: 2,
					blocks: 7,
					slam_dunks: 2,
					},
				"Bismak Biyombo" => {
					number: 0,
					shoe: 16,
					points: 12,
					rebounds: 4,
					assists: 7,
					steals: 7,
					blocks: 15,
					slam_dunks: 10,
					},
				"DeSagna Diop" => {
					number: 2,
					shoe: 14,
					points: 24,
					rebounds: 12,
					assists: 12,
					steals: 4,
					blocks: 5,
					slam_dunks: 5,
					},
				"Ben Gordon" => {
					number: 8,
					shoe: 15,
					points: 33,
					rebounds: 3,
					assists: 2,
					steals: 1,
					blocks: 1,
					slam_dunks: 0,
					},
				"Brendan Haywood" => {
					number: 33,
					shoe: 15,
					points: 6,
					rebounds: 12,
					assists: 12,
					steals: 22,
					blocks: 5,
					slam_dunks: 12,
				}
			}
		}
	}
end

def num_points_scored(player_name)
	if game_hash[:home][:players].has_key?(player_name)
		return game_hash[:home][:players][player_name][:points]
	elsif game_hash[:away][:players].has_key?(player_name)
		return game_hash[:away][:players][player_name][:points]
	else
		return nil
	end
end

def shoe_size(player_name)
	if game_hash[:home][:players].has_key?(player_name)
		return game_hash[:home][:players][player_name][:shoe]
	elsif game_hash[:away][:players].has_key?(player_name)
		return game_hash[:away][:players][player_name][:shoe]
	else
		return nil
	end
end

def team_colors(team_name)
	if game_hash[:home][:team_name] == team_name
		return game_hash[:home][:colors]
	elsif game_hash[:away][:team_name] == team_name
		return game_hash[:away][:colors]
	else
		return nil
	end
end

def team_names
	names = []
	names.push(game_hash[:home][:team_name])
	names.push(game_hash[:away][:team_name])
	names
end

def player_numbers(team_name)
	numbers = []
	if game_hash[:home][:team_name] == team_name
		game_hash[:home][:players].each do |name, stats|
			numbers.push(stats[:number])
		end
	elsif game_hash[:away][:team_name] == team_name
		game_hash[:away][:players].each do |name, stats|
			numbers.push(stats[:number])
		end
	else
		return nil
	end
	numbers	
end

def player_stats(player_name)
	if game_hash[:home][:players].has_key?(player_name)
		return game_hash[:home][:players][player_name]
	elsif game_hash[:away][:players].has_key?(player_name)
		return game_hash[:away][:players][player_name]
	else
		return nil	
	end
end

def big_shoe_rebounds
	shoe_max = 0
	rebound_max = 0
	game_hash[:home][:players].each do |name, stats|
		if stats[:shoe] > shoe_max
			shoe_max = stats[:shoe]
			rebound_max = stats[:rebounds]
		end
	end
	game_hash[:away][:players].each do |name, stats|
		if stats[:shoe] > shoe_max
			shoe_max = stats[:shoe]
			rebound_max = stats[:rebounds]
		end
	end
	rebound_max
end

def most_points_scored
	high_score = 0
	player = "temp"
	game_hash[:home][:players].each do |name, stats|
		if stats[:points] > high_score
			high_score = stats[:points]
			player = name
		end
	end
	game_hash[:away][:players].each do |name, stats|
		if stats[:points] > high_score
			high_score = stats[:points]
			player = name
		end
	end
	player
end

def winning_team
	home_total = 0
	away_total = 0
	game_hash[:home][:players].each do |name, stats|
		home_total += stats[:points]
	end
	game_hash[:away][:players].each do |name, stats|
		away_total += stats[:points]
	end
	
	if home_total > away_total
		return game_hash[:home][:team_name]
	elsif away_total > home_total
		return game_hash[:away][:team_name]
	else
		return "TIE GAME"
	end
end

def player_with_longest_name
	max_length = 0
	longest_name = "temp"
	game_hash[:home][:players].each do |name, stats|
		if name.length > max_length
			max_length = name.length
			longest_name = name
		end
	end
	game_hash[:away][:players].each do |name, stats|
		if name.length > max_length
			max_length = name.length
			longest_name = name
		end
	end
	longest_name
end

def long_name_steals_a_ton?
	player = player_with_longest_name
	if game_hash[:home][:players].has_key?(player)
		steals = game_hash[:home][:players][player][:steals]
	else
		steals = game_hash[:away][:players][player][:steals]
	end
	
	game_hash[:home][:players].each do |name, stats|
		if name != player
			if stats[:steals] > steals
				return false
			end
		end
	end
	game_hash[:away][:players].each do |name, stats|
		if name != player
			if stats[:steals] > steals
				return false
			end
		end
	end
	true
end