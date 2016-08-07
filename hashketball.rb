require 'pry'

def game_hash
  basketball_hash = {
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
        "Brendan Haywood"=> {
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

  return basketball_hash

end

def num_points_scored(name)
  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|

    	if attribute == :players

    		data.each do |player, stats|

       		if player == name

       			stats.each do |stat, value|

    					if stat == :points
     						return value
     					end
            end
          end
        end
      end
    end
  end
end


def shoe_size(name)
	game_hash.each do |location, team_data|

  	team_data.each do |attribute, data|

  		if attribute == :players

  			data.each do |player, stats|

  				if player == name
  					stats.each do |stat, value|

  						if stat == :shoe
  							return value
  						end
  					end
  				end
  			end
  		end
  	end
  end
end


def team_colors(team_name_str)

  game_hash.each do |location, team_data|

    team_data.each do |team_attributes, data|

      if team_name_str == data
      	return game_hash[location][:colors]
      end

    end

  end

end


def team_names
	array_of_teams = []

	game_hash.each do |location, team_data|

		team_data.each do |team_attributes, data|

			if team_attributes == :team_name
				array_of_teams.push(data)
			end

		end

	end

	return array_of_teams

end


def player_numbers(team)
	player_num_array = []

	game_hash.each do |location, team_data|

		team_data.each do |team_attributes, data|

			if data == team

				game_hash[location][:players].each do |player, stat|
					stat.each do |num_stat, number|
						if num_stat == :number
							player_num_array.push(number)
						end

					end

				end

			end

		end

	end

	return player_num_array
end

#takes argument of a player's name and returns a hash of their stats
def player_stats(player_name)
	player_hash_stats = {}
	game_hash.each do |location, team_data|
		team_data.each do |team_attributes, data|
			if team_attributes == :players
				data.each do |players_names, player_stats|
					if players_names == player_name
						player_hash_stats[players_names] = game_hash[location][team_attributes][players_names]
					end
				end
			end
		end
	end
	return player_hash_stats[player_name]
end


def big_shoe_rebounds
	player_w_big_shoe = nil
	player_w_big_shoes_size = 0
	player_w_big_shoes_rebounds = 0
	game_hash.each do |location, team_data|
		team_data.each do |team_attributes, data|
			if team_attributes == :players
				data.each do |players_names, player_stats|
					if player_stats[:shoe] > player_w_big_shoes_size
						player_w_big_shoes_size = player_stats[:shoe]
						player_w_big_shoe = players_names
						player_w_big_shoes_rebounds = game_hash[location][team_attributes][players_names][:rebounds]
					end
				end
			end
		end
	end
	return player_w_big_shoes_rebounds
end
