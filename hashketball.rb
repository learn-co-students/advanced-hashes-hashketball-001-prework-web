require 'pry'

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

#takes in an argument of a player's name and returns the number
#of points scored for that player.
def num_points_scored(player_name)
  temp_hash = game_hash[:home][:players].merge(game_hash[:away][:players])
  temp_hash[player_name][:points]
end

#takes in an argument of a player's name and returns the shoe size
#for that player.
def shoe_size(player_name)
  temp_hash = game_hash[:home][:players].merge(game_hash[:away][:players])
  temp_hash[player_name][:shoe]  
end

#takes in an argument of the team name and returns an array of that teams colors.
def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]  
  end
end

#operates on the game hash to return an array of the team names.
def team_names
  all_teams = [] << game_hash[:home][:team_name] << game_hash[:away][:team_name]
end

#!#!#!#!#!#!# STUCK HERE !#!#!#!#!#!#!#!#

#takes in an argument of a team name and returns an array of the
#jersey number's for that team.
def player_numbers(team_name)
  numbers = []
  game_hash.each_value do |value|
    #binding.pry
    if value[:team_name] == team_name
      value[:players].values.each do |stats|
      numbers << stats[:number]   
      end
    end
  end  
    #binding.pry
    #   numbers << value[:number]
    
    # end
    # game_hash[team_name][ :players].each_value do |value|
    #   numbers << value[:number]
    
  numbers
end

#takes in an argument of a player's name and returns a hash of that player's 
#stats. The stat hash should not include the player's name.
def player_stats(player_name)
  temp_hash = game_hash[:home][:players].merge(game_hash[:away][:players])
  temp_hash[player_name]
end

#will return the number of rebounds associated with the player that has
#the largest shoe size. 
def big_shoe_rebounds
  temp_hash = game_hash[:home][:players].merge(game_hash[:away][:players])
  shoe_size = []
  temp_hash.each do |key, value|
    shoe_size << value[:shoe]
  end
  temp_hash.each do |key, value|
    if value[:shoe] == shoe_size.max
      return value[:rebounds]
    end
  end
end

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
 
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end

# good_practices