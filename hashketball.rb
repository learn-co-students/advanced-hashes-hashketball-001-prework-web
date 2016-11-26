# Write your code here!
require 'pry'
def game_hash
	value = {
		:home => {
			:team_name =>"Brooklyn Nets",
			:colors =>["Black", "White"],
			:players =>{"Alan Anderson" =>	{
											number: 0,
											shoe: 16,
											points: 22,
											rebounds: 12,
											assists: 12,
											steals: 3,
											blocks: 1,
											slam_dunks: 1},
						"Reggie Evans" =>  {
											number: 30,
											shoe: 14,
											points: 12,
											rebounds: 12,
											assists: 12,
											steals: 12,
											blocks: 12,
											slam_dunks: 7},
						"Brook Lopez" =>   { 
											number: 11,
											shoe: 17,
											points: 17,
											rebounds: 19,
											assists: 10,
											steals: 3,
											blocks: 1,
											slam_dunks: 15},
						"Mason Plumlee" => { 
											number: 1,
											shoe: 19,
											points: 26,
											rebounds: 12,
											assists: 6,
											steals: 3,
											blocks: 8,
											slam_dunks: 5},
						"Jason Terry" =>   { 
											number: 31,
											shoe: 15,
											points: 19,
											rebounds: 2,
											assists: 2,
											steals: 4,
											blocks: 11,
											slam_dunks: 1}
			}
		},
		:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players => {
						"Jeff Adrien" =>   { 
											number: 4,
											shoe: 18,
											points: 10,
											rebounds: 1,
											assists: 1,
											steals: 2,
											blocks: 7,
											slam_dunks: 2},
						"Bismak Biyombo" =>{ 
											number: 0,
											shoe: 16,
											points: 12,
											rebounds: 4,
											assists: 7,
											steals: 7,
											blocks: 15,
											slam_dunks: 10},
						"DeSagna Diop" =>   { 
											number: 2,
											shoe: 14,
											points: 24,
											rebounds: 12,
											assists: 12,
											steals: 4,
											blocks: 5,
											slam_dunks: 5},
						"Ben Gordon" =>     { 
											number: 8,
											shoe: 15,
											points: 33,
											rebounds: 3,
											assists: 2,
											steals: 1,
											blocks: 1,
											slam_dunks: 0},
						"Brendan Haywood" => { 
											number: 33,
											shoe: 15,
											points: 6,
											rebounds: 12,
											assists: 12,
											steals: 22,
											blocks: 5,
											slam_dunks: 12}
			}
		}
	}
end


def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(name)
	#takes in an arguments of player's name 
	#return the number of points scored for that party
	collection = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if :players == attribute
				data.each do |player, stat|
					if name == player
						collection << stat[:points]
					end
				end
			end
		end
	end
	collection.join("").to_i

end

def shoe_size(name)
	collection = []
	game_hash.each do |location, team_data| #location home/away , team_data team_name, color,players
		team_data.each do |attribute, data| #same as team_data, data keyvalue array
			if :players == attribute
				data.each do |player, stat|
					if name == player
						collection << stat[:shoe]
					end
				end
			end
		end
	end
	collection.join("").to_i
end

def team_colors(team_name)
	collection = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if :team_name == attribute 
				if team_name == data
					for counter in 0...game_hash[location][:colors].size do 
						collection << game_hash[location][:colors][counter]
					end
				end
			end

		end
	end
	collection
end

def team_names
	collection = []
	game_hash.each do |location, team_data| #key, value
		team_data.each do |attribute, data|
			if :team_name == attribute
				collection << game_hash[location][:team_name]
			end
		end
	end
	collection
end

def player_numbers(team_name)
	collection = []
	game_hash.each do |location, team_data| #key= home/away
		team_data.each do |attribute, data| #team_name,player, data = {},[] ""
			if :team_name == attribute && team_name == data
				game_hash.each do |location, team_data|
					team_data.each do |attribute, data|
						if :players == attribute && game_hash[location][:team_name] == team_name 
							data.each do |player, stat|
								collection << data[player][:number]
							end
						end
					end
				end
			end
		end
	end
	collection
end

def player_stats(player_name)
	collection = {}
	game_hash.each do |location, team_data| #key = home/away
		team_data.each do |attribute, data|
			if :players == attribute
				data.each do |member, statu|
						if member == player_name
							statu.delete_if  do |key, value|
								key.to_s == player_name
							end
							collection = statu
						else
						end
					# if player_name == member
					# 	collection[player_name] = data[player_name]
					# end
				end
			end
		end
	end
	collection
end

def big_shoe_rebounds
	collection = []
	big_shoes = 0
	mostRebounds = 0
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if :players == attribute
				data.each do |member, statu|
					collection << statu[:shoe]
				end
			end
		end
	end
	collection.sort! do |a, b|
		b <=> a
	end

	big_shoes = collection[0] #it is sorted number first index is the biggest number
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if :players == attribute
				data.each do |member, statu|
					if statu[:shoe] == big_shoes
						mostRebounds = statu[:rebounds] 
					end
				end
			end
		end
	end
	mostRebounds
end







