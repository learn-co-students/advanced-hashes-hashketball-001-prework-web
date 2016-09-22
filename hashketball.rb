# Write your code here!
require "pry"


def game_hash
  hash = {  
    :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players =>  {
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
            },                                              
          }
        },
    :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players =>  {
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
            },                                              
          }
          }
        }
    return hash 
end

def num_points_scored (player_name)
    player_points = {}
    game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_data|
            player_points[player] = player_data[:points]
        end
    end
    return player_points[player_name]
end

def shoe_size (player_name)
    player_shoe = {}
    game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_data|
            player_shoe[player] = player_data[:shoe]
        end
    end
    return player_shoe[player_name]
end

def team_colors (team)
    if game_hash[:home][:team_name] == team
        return game_hash[:home][:colors]
    else 
        return game_hash[:away][:colors]
    end
end

def team_names
    names = []
    game_hash.each do |location, team_data|
        names << team_data[:team_name]
    end
    return names
end

def player_numbers(team_name)
    home_player_numbers = []
    away_player_numbers = []
    game_hash[:home][:players].each do |player, player_data|
        home_player_numbers << player_data[:number]
    end
    game_hash[:away][:players].each do |player, player_data|
        away_player_numbers << player_data[:number]
    end
    if team_name == game_hash[:home][:team_name]
        return home_player_numbers
    elsif team_name == game_hash[:away][:team_name]
        return away_player_numbers
    else puts "no players found!"
    end
end

def player_stats(player_name)
    if game_hash[:home][:players].key?(player_name) == true 
        return game_hash[:home][:players][player_name]
    elsif game_hash[:away][:players].key?(player_name) == true 
        return game_hash[:away][:players][player_name]
    end
end

def big_shoe_rebounds
    player_shoe = {}
    game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_data|
            player_shoe[player] = player_data[:shoe]
        end
    end
    max_size = player_shoe.values.max
    game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_data|
            if player_data[:shoe] == max_size
                return player_data[:rebounds]
            end
        end
    end
end