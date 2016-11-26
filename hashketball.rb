# Write your code here!

require 'pry'

def game_hash
	{
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
					slam_dunks: 1
				},
				
				"Reggie Evans" => {
					number: 30,
					shoe: 14,
					points: 12,
					rebounds: 12,
					assists: 12,
					steals: 12,
					blocks: 12,
					slam_dunks: 7
				},
				
				"Brook Lopez" => {
					number: 11,
					shoe: 17,
					points: 17,
					rebounds: 19,
					assists: 10,
					steals: 3,
					blocks: 1,
					slam_dunks: 15
				},
				
				"Mason Plumlee" => {
					number: 1,
					shoe: 19,
					points: 26,
					rebounds: 12,
					assists: 6,
					steals: 3,
					blocks: 8,
					slam_dunks: 5
				},
				
				"Jason Terry" => {
					number: 31,
					shoe: 15,
					points: 19,
					rebounds: 2,
					assists: 2,
					steals: 4,
					blocks: 11,
					slam_dunks: 1
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
					slam_dunks: 2
				},

				"Bismak Biyombo" => {
					number: 0,
					shoe: 16,
					points: 12,
					rebounds: 4,
					assists: 7,
					steals: 7,
					blocks: 15,
					slam_dunks: 10
				},

				"DeSagna Diop" => {
					number: 2,
					shoe: 14,
					points: 24,
					rebounds: 12,
					assists: 12,
					steals: 4,
					blocks: 5,
					slam_dunks: 5
				},

				"Ben Gordon" => {
					number: 8,
					shoe: 15,
					points: 33,
					rebounds: 3,
					assists: 2,
					steals: 1,
					blocks: 1,
					slam_dunks: 0
				},

				"Brendan Haywood" => {
					number: 33,
					shoe: 15,
					points: 6,
					rebounds: 12,
					assists: 12,
					steals: 22,
					blocks: 5,
					slam_dunks: 12
				}
			}

			}
	}

end

def game_hash_values
	game_hash.values
	
end


def get_players_data
	game_hash.values.map do |team|
		team[:players]
	end
end


def player_data(name)
	players_array = get_players_data
	players_hash = players_array[0].merge(players_array[1])
	return players_hash[name]
	
end



def num_points_scored(name)
	name_data = player_data(name)
	return name_data[:points]
	
end

def shoe_size(name)
	name_data = player_data(name)
	return name_data[:shoe]

end


def teams_data
	game_hash.values
end



def team_colors(team_name)
		colors = []
		teams_data.each do |team|
			if team[:team_name] == team_name
				colors = team[:colors]
			end
		end
	return colors
		
end

def team_names
	[teams_data[0][:team_name], teams_data[1][:team_name]]
end


def get_team_players(team_name)
	teams_data.each do |team|
		if team[:team_name] == team_name
		
		end
	end	
end

def player_numbers(team_name)
	player_numbers = []
	teams_data.each do |team|
		if team[:team_name] == team_name
			players = team[:players]
		
			players.each do |player, player_stats|
				player_numbers << player_stats[:number]
				
			end
		end
	end
	return player_numbers
	
end

def player_stats(name)
	player_data(name)
	
end

def big_shoe_rebounds
	shoe_hash = {}
	players_array = get_players_data
	players_hash = players_array[0].merge(players_array[1])
	players_hash.each do |name, stat_hash|
		shoe_hash[name] = stat_hash[:shoe]
	end
	binding.pry
	big_shoe = shoe_hash.values.sort.pop
	big_name = shoe_hash.key(big_shoe)
	return players_hash[big_name][:rebounds]
end

#make a new array of shoe sizes, sort it, pop(?) the biggest one off the end, then use key ... first make a new hash of names and shoe sizes, then use that to make the array of shoe sizes, then use that to get the name. then use player_stats to get get the rebounds



#	players_data_array.each do |player_hash|
#		player_hash.each do |player_name, stats|
#		
#			if player_name == name
#			
#				players_data_array[player_hash][player_name][:points]
				
#			end
#		end
#	end
#	players_data_array[player_hash][player_name][:points]	
#end








