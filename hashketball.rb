# Write your code here!
require 'pry'

def game_hash
    games = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black","White"],
            :players => [
                                {:player_name => "Alan Anderson",
                                :number => 0,
                                :shoe => 16,
                                :points => 22,
                                :rebounds => 12,
                                :assists => 12,
                                :steals => 3,
                                :blocks => 1,
                                :slam_dunks => 1 },

                                {:player_name => "Reggie Evans",
                                :number => 30,
                                :shoe => 14,
                                :points => 12,
                                :rebounds => 12,
                                :assists => 12,
                                :steals => 12,
                                :blocks => 12,
                                :slam_dunks => 7},

                                {:player_name => "Brook Lopez",
                                :number => 11,
                                :shoe => 17,
                                :points => 17,
                                :rebounds => 19,
                                :assists => 10,
                                :steals => 3,
                                :blocks => 1,
                                :slam_dunks => 15},

                                {:player_name => "Mason Plumlee",
                                :number => 1,
                                :shoe => 19,
                                :points => 26,
                                :rebounds => 12,
                                :assists => 6,
                                :steals => 3,
                                :blocks => 8,
                                :slam_dunks => 5},

                                {:player_name => "Jason Terry",
                                :number => 31,
                                :shoe => 15,
                                :points => 19,
                                :rebounds => 2,
                                :assists => 2,
                                :steals => 4,
                                :blocks => 11,
                                :slam_dunks => 1}]
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise","Purple"],
            :players => [
                                {:player_name => "Jeff Adrien",
                                :number => 4,
                                :shoe => 18,
                                :points => 10,
                                :rebounds => 1,
                                :assists => 1,
                                :steals => 2,
                                :blocks => 7,
                                :slam_dunks => 2},

                                {:player_name => "Bismak Biyombo",
                                :number => 0,
                                :shoe => 16,
                                :points => 12,
                                :rebounds => 4,
                                :assists => 7,
                                :steals => 7,
                                :blocks => 15,
                                :slam_dunks => 10},

                                {:player_name => "DeSagna Diop",
                                :number => 2,
                                :shoe => 14,
                                :points => 24,
                                :rebounds => 12,
                                :assists => 12,
                                :steals => 4,
                                :blocks => 5,
                                :slam_dunks => 5},

                                {:player_name => "Ben Gordon",
                                :number => 8,
                                :shoe => 15,
                                :points => 33,
                                :rebounds => 3,
                                :assists => 2,
                                :steals => 1,
                                :blocks => 1,
                                :slam_dunks => 0 },

                                {:player_name => "Brendan Haywood",
                                :number => 33,
                                :shoe => 15,
                                :points => 6,
                                :rebounds => 12,
                                :assists => 12,
                                :steals => 22,
                                :blocks => 5,
                                :slam_dunks => 12}]
        }

    }
    return games
end

def points_calc(player_array, player_selection)
  player_array.each do |player|
    return player[:points] if player[:player_name] == player_selection
  end
  return false
end

def num_points_scored(player_selection)
  if points_calc(game_hash[:home][:players], player_selection)
    return points_calc(game_hash[:home][:players], player_selection)
  elsif points_calc(game_hash[:away][:players], player_selection)
    return points_calc(game_hash[:away][:players], player_selection)
  end
end


def shoe_calc(player_array, player_selection)
  player_array.each do |player|
    return player[:shoe] if player[:player_name] == player_selection
  end
  return false
end

def shoe_size(player_selection)
  if shoe_calc(game_hash[:home][:players], player_selection)
    return shoe_calc(game_hash[:home][:players], player_selection)
  elsif shoe_calc(game_hash[:away][:players], player_selection)
    return shoe_calc(game_hash[:away][:players], player_selection)
  end
end



def team_colors(team_name)
    game_hash.each do |location, team_data|
        return team_data[:colors] if team_data[:team_name] == team_name
    end
end

def team_names()
    #returns the team names
    name_list = []
    game_hash.collect do |location, team_data|
        team_data[:team_name]
    end
end


def player_numbers(team_name)
    pennies = []
    game_hash.each do |location, team_data|
        if team_data[:team_name] == team_name
            team_data[:players].each do |x|
                pennies.push(x[:number])
            end
        end
    end
    return pennies
end


def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |a|
      if a[:player_name] == player_name
        my_hash = a
        my_hash.shift
        return my_hash
      end
    end
  end
end

def big_shoe_rebounds()
    #find largest shoe size
    #find players # of rebounds
    biggest_shoe = 0
    game_hash.each do |location, team_data|
        team_data[:players].each do |a|
            if a[:shoe] > biggest_shoe
                biggest_shoe = a[:shoe]
            end
        end
    end

    rebounds = nil
    game_hash.each do |location, team_data|
        team_data[:players].each do |a|
            if a[:shoe] == biggest_shoe
                rebounds = a[:rebounds]
            end
        end
    end
    return rebounds
end
