require 'pry'


def game_hash
{

	:home => {
		:team_name => "Brooklyn Nets",
		:colors => ["Black", "White"],
		:players => {

			"Alan Anderson" => {
        :name => "Alan Anderson",
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
			  :name => "Reggie Evans",
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
        :name => "Brook Lopez",
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
			  :name => "Mason Plumlee",
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
			  :name => "Jason Terry",
				:number => 31,
				:shoe => 15,
				:points => 19,
				:rebounds => 2,
				:assists => 2,
				:steals => 4,
				:blocks => 11, 
				:slam_dunks => 1
				} 
			} #:players
	}, #:home

	:away => {
	:team_name => "Charlotte Hornets",
	:colors => ["Turquoise", "Purple"],
	:players =>{

      "Jeff Adrien" => {
			  :name => "Jeff Adrien", 
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
			  :name => "Bismak Biyombo",
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
			  :name => "DeSagna Diop",
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
			  :name => "Ben Gordon",
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
			  :name => "Brendan Haywood",
				:number => 33,
				:shoe => 15,
				:points => 6,
				:rebounds => 12,
				:assists => 12,
				:steals => 22,
				:blocks => 5,
				:slam_dunks => 12
				}
			} #:players
		} #:away
  }
end

 
def num_points_scored(name)
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == name
        return player_hash[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == name
        return player_hash[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_hash|
    if team_hash[:team_name] == team
      return team_hash[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team_hash|
    team_hash[:team_name]
  end
end

def player_numbers(name)
  numArray = []
  game_hash.each do |location, team_hash|
    if team_hash[:team_name] == name
      team_hash[:players].each do |player, player_hash|
        numArray << player_hash[:number]
      end
    end
  end
  return numArray
end

def player_stats(player_name)
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash.delete_if{|key, val| val == player_name}
      end
    end
  end
end

def big_shoe_rebounds
  #determine largest shoe eize
  #return rebounds
  biggestSizeHash = nil

  #save the whole hash of the player with the most rebounds
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player, player_hash|
      biggestSizeHash ||= player_hash
      if player_hash[:shoe] > biggestSizeHash[:shoe]
        biggestSizeHash ||= player_hash
      end  
    end
  end

  #return :rebunds from the hash above
  return biggestSizeHash[:rebounds]

end

big_shoe_rebounds
