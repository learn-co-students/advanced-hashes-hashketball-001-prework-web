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
			colors: ["Turqouise", "Purple"],
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

				"Bismack Biyombo" => {
					number: 0,
					shoe: 16,
					points: 12,
					rebounds: 4,
					assists: 7,
					steals: 7,
					blocks: 15,
					slam_dunks: 10
				},

				"Desagna Diop" => {
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


def get_players_data(hash)
	game_hash.values.flatten.map do |team|
		team[:players]
	end
end

def players_data
	get_players_data(game_hash)
	
end

players_data


#this is stupid messy because i tried so many things to figure out what was garbage. the upshot is, all the values are correct -- points[0] ends up being the correct number, etc -- but the return value is nil, and i don't know why


def num_points_scored(name)
	
	points = []

	players_data_array = get_players_data(game_hash)

	player_hash = players_data_array[0].merge(players_data_array[1])

	player_hash.each do |player_name, player_stats|
		if player_name == name
			player_hash[name][:points]
			binding.pry
			points << player_hash[name][:points]
			binding.pry
		end
	end
	points[0]
	binding.pry
end





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








