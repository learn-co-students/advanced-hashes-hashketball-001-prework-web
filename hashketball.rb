# Write your code here!
require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
          },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
          },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
          },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
          },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
          }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
          },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
          },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
          },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
          },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
          }
      }
    }
  }
end

def num_points_scored(player_name)
  player_score = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == player_name
            stats.each do |type, number|
              if type == :points
                player_score = number
              end
            end
          end
        end
      end
    end
  end
  player_score
end

def shoe_size(player_name)
  shoe_size = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == player_name
            stats.each do |type, number|
              if type == :shoe
                shoe_size = number
              end
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  team_colors = []
  game_hash.each do |location, team_data|
    if team_data.values.include?(team_name)
      team_data.each do |attribute, data|
        if attribute == :colors
          team_colors = data
        end
      end
    end
  end
  team_colors 
end

def team_names
  team_names_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_names_array << data
      end
    end
  end
  team_names_array
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    if team_data.values.include?(team_name)
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |name, stats|
            stats.each do |type, number|
              if type == :number
                jersey_numbers << number
              end
            end
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  player_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == player_name
            player_hash = stats
          end
        end
      end
    end
  end
  player_hash
end

def rebounds(player_name)
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == player_name
            stats.each do |type, number|
              if type == :rebounds
                rebounds = number
              end
            end
          end
        end
      end
    end
  end
  rebounds
end

def big_shoe_rebounds
  big_shoe_size = 0
  big_shoe_player = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          stats.each do |type, number|
            if type == :shoe
              if number > big_shoe_size
                big_shoe_size = number
                big_shoe_player = name
              end
            end
          end
        end
      end
    end
  end
  rebounds(big_shoe_player)
end