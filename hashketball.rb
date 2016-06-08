# Write your code here!
require "pry"

def game_hash
	game = { :home => {:team_name => "Brooklyn Nets", 
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
				:slam_dunks => 1}, 
				"Reggie Evans" => {
				:number => 30,
				:shoe => 14,
				:points => 12,
				:rebounds => 12,
				:assists => 12,
				:steals => 12,
				:blocks => 12,
				:slam_dunks => 7 }, 
				"Brook Lopez" => {
				:number => 11,
				:shoe => 17,
				:points => 17,
				:rebounds => 19,
				:assists => 10,
				:steals => 3,
				:blocks => 1,
				:slam_dunks => 15}, 
				"Mason Plumlee" => {
				:number => 1,
				:shoe => 19,
				:points => 26,
				:rebounds => 12,
				:assists => 6,
				:steals => 3,
				:blocks => 8,
				:slam_dunks => 5 },
				"Jason Terry" => {
				:number => 31,
				:shoe => 15,
				:points => 19,
				:rebounds => 2,
				:assists => 2,
				:steals => 4,
				:blocks => 11,
				:slam_dunks => 1}
				
			}
			}, 
			
	 :away => {:team_name => "Charlotte Hornets", 
			:colors => ["Turquoise", "Purple"], 
			:players => {"Jeff Adrien" => {
				:number => 4,
				:shoe => 18,
				:points => 10,
				:rebounds => 1,
				:assists => 1,
				:steals => 2,
				:blocks => 7,
				:slam_dunks => 2}, 
				"Bismak Biyombo" => {
				:number => 0,
				:shoe => 16,
				:points => 12,
				:rebounds => 4,
				:assists => 7,
				:steals => 7,
				:blocks => 15,
				:slam_dunks => 10 }, 
				"DeSagna Diop" => {
				:number => 2,
				:shoe => 14,
				:points => 24,
				:rebounds => 12,
				:assists => 12,
				:steals => 4,
				:blocks => 5,
				:slam_dunks => 5},
				"Ben Gordon" => {
				:number => 8,
				:shoe => 15,
				:points => 33,
				:rebounds => 3,
				:assists => 2,
				:steals => 1,
				:blocks => 1,
				:slam_dunks => 0}, 
				"Brendan Haywood" => {
				:number => 33,
				:shoe => 15,
				:points => 6,
				:rebounds => 12,
				:assists => 12,
				:steals => 22,
				:blocks => 5,
				:slam_dunks => 12 }
				
				
			}
	
	} 
	}
end 

	

def num_points_scored(player)
	game_hash.each do |team, team_info|
		team_info[:players].each do |member, stats|
			 if member==player
			 		return stats[:points]
			 end 
		end 
	end 
end



def shoe_size(player)
	game_hash.each do |team, team_info|
		team_info[:players].each do |member, stats|
			 if member==player
			 		return stats[:shoe]
			 end 
		end 
	end 
end

def team_colors(team)
	game_hash.each do |teams, teaminfo|
		if teaminfo[:team_name]==team
			return teaminfo[:colors]
		end 
	end 
end 

def team_names 
	game_hash.collect do |location, teams| 
		teams[:team_name]
	end  
end 


def player_numbers(team)
	game_hash.each_with_object([]) do |(teams, team_info), result|
		if team == team_info[:team_name]	
			team_info[:players].each do |key, value|
					result << value[:number] 
			end 
		end  	 
	end 
end 

def player_stats(player)
	game_hash.each do |team, team_info|
		team_info[:players].each do |key, stats| 
			return stats if key==player 
		end 
	end 
end 

def big_shoe_rebounds
	big_shoe=0
	big_rebound=0
	game_hash.values.each do |team_info|
		team_info[:players].values.each do |value|
			if  big_shoe < value[:shoe] 
				big_shoe= value[:shoe]
				big_rebound = value[:rebounds]
			end 
		end 
	end	
	big_rebound
end 


def most_points_scored
	most_points=0
	player=""
	game_hash.values.each do |team_info|
		team_info[:players].each do |person, value|
			if  most_points < value[:points] 
				most_points= value[:points]
				player = person
			end 
		end 
	end	
	player
end 

def winning_team
	brooklyn_nets=0
	charlotte_hornets=0
	game_hash.values.each do |team_info|
		if team_info[:team_name]=="Brooklyn Nets"
			team_info[:players].values.each do |value|
				brooklyn_nets+=value[:points]
			end 
		else 
			team_info[:players].values.each do |value|
				charlotte_hornets+=value[:points]
			end 
		end
	end 
		if brooklyn_nets>charlotte_hornets
			return  "Brooklyn Nets"
		else 
			return "Charlotte Hornets"
		end 
end 

def player_with_longest_name


end 
 
