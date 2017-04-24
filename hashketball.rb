# Write your code here!
require 'pry'

def game_hash
  hash = {
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

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
#     binding.pry
    team_data.each do |attribute, data|
      if attribute == :players
#         binding.pry
        data.each do |player, stats|
#           binding.pry
          if player == player_name
            return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
#         binding.pry
        return team_data[:colors]
      end
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data.values_at(:team_name)
  end
  teams.flatten
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    if team_data.has_value?(team_name)
      team_data[:players].each do |player, stats|
#         binding.pry
        jersey_numbers << stats[:number]
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  # find the player with the largest shoe size
  results_hash = {
    :largest_foot => 0,
    :rebounds => 0
    }
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:shoe] > results_hash[:largest_foot]
            results_hash[:largest_foot] = stats[:shoe]
            results_hash[:rebounds] = stats[:rebounds]
          end
        end
      end
    end
  end
  # return that player's number of rebounds
  results_hash[:rebounds]
end

# Which player has the most points?
def most_points_scored
  results_hash = {
    :points => 0,
    :player_name => ""
    }
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:points] > results_hash[:points]
            results_hash[:points] = stats[:points]
            results_hash[:player_name] = player
          end
        end
      end
    end
  end
  results_hash[:player_name]
end

# Which team has the most points?
def winning_team
  results_hash = {
    :home => {
      :team_name => "",
      :total_score => 0
      },
    :away => {
      :team_name => "",
      :total_score => 0
      }
    }
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        results_hash[location][:team_name] = data
      elsif attribute == :players
        data.each do |name, stats|
          results_hash[location][:total_score] += stats[:points]
        end
      end
    end
  end
  if results_hash[:home][:total_score] > results_hash[:away][:total_score]
    results_hash[:home][:team_name]
  else
    results_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each_key do |name|
          if name.length > longest_name.length
            longest_name = name
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  results_hash = {
    :high_steals => {
      :player_name => "",
      :steals => 0
    },
    :longest_name => ""
  }
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player.length > results_hash[:longest_name].length
            results_hash[:longest_name] = player
          end
          if stats[:steals] > results_hash[:high_steals][:steals]
            results_hash[:high_steals][:player_name] = player
            results_hash[:high_steals][:steals] = stats[:steals]
          end
        end
      end
    end
  end
  if results_hash[:high_steals][:player_name] == results_hash[:longest_name]
    return true
  else
    return false
  end
end

# long_name_steals_a_ton?
