# Write your code here!
require 'pry'

def game_hash
  game_hash = {
    :home => {
        :team_name => 'Brooklyn Nets',
        :colors => ['Black', 'White'],
        :players => {
            :player1 => {
                :name => 'Alan Anderson',
                :stats => {
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                }
            },
            :player2 => {
                :name => 'Reggie Evans',
                :stats => {
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                }
            },
            :player3 => {
                :name => 'Brook Lopez',
                :stats => {
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                }
            },
            :player4 => {
                :name => 'Mason Plumlee',
                :stats => {
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                }
            },
            :player5 => {
                :name => 'Jason Terry',
                :stats => {
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
        }
    },
    :away => {
        :team_name => 'Charlotte Hornets',
        :colors => ['Turquoise', 'Purple'],
        :players => {
            :player1 => {
                :name => 'Jeff Adrien',
                :stats => {
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                }
            },
            :player2 => {
                :name => 'Bismak Biyombo',
                :stats => {
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15,
                    :slam_dunks => 10
                }
            },
            :player3 => {
                :name => 'DeSagna Diop',
                :stats => {
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                }
            },
            :player4 => {
                :name => 'Ben Gordon',
                :stats => {
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                }
            },
            :player5 => {
                :name => 'Brendan Haywood',
                :stats => {
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
  }
end

=begin
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

good_practices
=end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |k, v|
      if v[:name] == player_name
        return v[:stats][:points]
      end
    end
  end
end


def num_rebounds_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |k, v|
      if v[:name] == player_name
        return v[:stats][:rebounds]
      end
    end
  end
end


def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |k, v|
      if v[:name] == player_name
        return v[:stats][:shoe]
      end
    end
  end
end


def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  team_array = []
  game_hash.each do |location, team_data|
     team_array << team_data[:team_name]
  end
  return team_array
end

def player_numbers(team_name)
  player_number_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |k, v|
        player_number_array << v[:stats][:number]
      end
    end
  end
  return player_number_array
end


def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |k, v|
      if v[:name] == player_name
        return v[:stats]
      end
    end
  end
end


def big_shoe_rebounds
  largest_shoe_size = 0
  num_rebounds_for_largest_shoe = 0;
  player_with_largest_shoe = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |k, v|
      if v[:stats][:shoe] > largest_shoe_size
        largest_shoe_size = v[:stats][:shoe]
        player_with_largest_shoe = v[:name]
        num_rebounds_for_largest_shoe = num_rebounds_scored(player_with_largest_shoe)
      end
    end
  end
  num_rebounds_for_largest_shoe
end


#BONUS SECTION
def most_points_scored
  most_points = 0
  player_with_most_points = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |k, v|
      if v[:stats][:points] > most_points
        most_points = v[:stats][:points]
        player_with_most_points = v[:name]
      end
    end
  end
  return player_with_most_points
end


def most_steals
  most_steals = 0
  player_with_most_steals = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |k, v|
      if v[:stats][:steals] > most_steals
        most_steals = v[:stats][:steals]
        player_with_most_steals = v[:name]
      end
    end
  end
  return player_with_most_steals
end


def winning_team
  hornets_points_array = []
  nets_points_array = []
  hornets_point_total = 0
  nets_point_total = 0

    game_hash.each do |location, team_data|
        team_data[:players].each do |k, v|
          if team_data[:team_name] == "Brooklyn Nets"
            nets_point_total = nets_point_total + v[:stats][:points]
            #nets_points_array << v[:stats][:points]
          else
            #hornets_points_array << v[:stats][:points]
            hornets_point_total = hornets_point_total + v[:stats][:points]
          end
        end
    end
    if nets_point_total > hornets_point_total
      return "Brooklyn Nets"
    else
      return "Charlotte Hornets"
    end
end


def player_with_longest_name
  longest_name = 0
  player_with_longest_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |k, v|
      if v[:name].length > longest_name
        longest_name = v[:name].length
        player_with_longest_name = v[:name]
      end
    end
  end
  return player_with_longest_name
end


def long_name_steals_a_ton?
  player_longest_name = ""
  player_longest_name = player_with_longest_name
  player_most_steals = ""
  player_most_steals = most_steals
  if player_with_longest_name == player_most_steals
    return true
  else
    return false
  end
end






