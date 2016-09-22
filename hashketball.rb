# Write your code here!
require 'pry'

def game_hash
  return {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan_Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie_Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook_Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason_Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason_Terry" => {
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
        "Jeff_Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak_Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna_Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben_Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan_Haywood" => {
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

def num_points_scored(player_name)
  points = 0
  game_hash.each { |location, team_data|
    name = player_name.split(" ").join("_")
    points = team_data[:players][name][:points] if team_data[:players].keys.include?(name)
  }
  points
end

def shoe_size(player_name)
  shoe_size = 0
  game_hash.each { |location, team_data|
    name = player_name.split(" ").join("_")
    shoe_size = team_data[:players][name][:shoe] if team_data[:players].keys.include?(name)
  }
  shoe_size
end

def team_colors(team_name)
  colors = []
  game_hash.each { |location, team_data|
    colors = team_data[:colors] if team_data[:team_name] == team_name
  }
  colors
end

def team_names
  team_names = []
  game_hash.each { |location, team_data|
    team_names << team_data[:team_name]
  }
  team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each { |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each { |attribute, play_data|
        jersey_numbers << play_data[:number]
      }
    end
  }
  jersey_numbers
end

def player_stats(player_name)
  name = player_name.split(" ").join("_")
  player_stats = Hash.new

  game_hash.each { |location, team_data|
    player_stats = team_data[:players][name] if team_data[:players].keys.include?(name)
  }
  player_stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each { |location, team_data|
    team_data[:players].each { |attribute, player_data|
      if player_data[:shoe] > shoe_size
        shoe_size = player_data[:shoe]
        rebounds = player_data[:rebounds]
      end
    }
  }
  rebounds
end
