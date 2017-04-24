require 'pry'
# Write your code here!

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

def num_points_scored(name)
score= 0
    game_hash.each do |key, value|
        value.each do |key2, value2|
            if key2.to_s == "players"
              	value2.each do |key3, value3|
                	if key3 == name
                    score = value3[:points]
                	end
            	end
            end
        end
    end
    score
end

def shoe_size(name)
	shoe_size= 0
    game_hash.each do |key, value|
        value.each do |key2, value2|
            if key2.to_s == "players"
              value2.each do |key3, value3|
                if key3 == name
                    shoe_size = value3[:shoe]
                end
             end
            end
        end
    end
    shoe_size
end

def team_colors(team)
	colors = []
	game_hash.each do |key, value|
		if value.has_value?(team)
			value.map do |key2, value2|
				if key2 == :colors
				colors << value2
				end
			end
		end
	end
	colors.flatten
end

def team_names
	teams = []
	game_hash.each do |key, value|
		value.each do |key2, value2|
			if key2 == :team_name
				teams << value2
			end
		end
	end
	teams
end

def player_numbers(team)
	numbers = []
	game_hash.each do |key, value|
		value.map do |key2, value2|
			if value2.to_s == team
				game_hash[key][:players].each do |key3,value3|
                    numbers << value3[:number]
                end
            end
        end
    end
    numbers
end

def player_stats(player)
stats = {}
    game_hash.each do |k,v|
        v.each do |k2, v2|
            if k2 == :players
                v2.each do |k3, v3|
                    if k3 == player
                        stats = v3
                    end
                end
            end
        end
    end    
 stats
end

def big_shoe_rebounds
	 size = 0 
 	 final = 0  
    game_hash.each do |k,v|
        game_hash[k][:players].each do |k2,v2|
            if v2[:shoe] >size
                size = v2[:shoe]
            end
        end
    end

    game_hash.each do |k,v|
        game_hash[k][:players].each do |k2,v2|
            v2.each do |k3, v3|
                if  v2[:shoe] == size
                    final = v2[:rebounds]
                end
            end
        end
    end
    final
end










