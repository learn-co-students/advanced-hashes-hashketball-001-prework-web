require 'pry'
# Write your code here!
def game_hash
  hash_for_game = {
    home: {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      players: {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks=> 1
          },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks=> 7
          },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks=> 15
          },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks=> 5
          },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks=> 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks=> 2
          },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks=> 10
          },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks=> 5
          },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks=> 0
          },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks=> 12
        }
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == name
            return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == name
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(teams_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == teams_name
        return team_data[:colors]
      end
    end
  end
end

def team_names
  team_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_array << data
      end
    end
  end
  team_array
end

def player_numbers(teams_name)
  numbers_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == teams_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            numbers_array << stats[:number]
          end
        end
      end
    end
  end
  numbers_array
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_sizes = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          shoe_sizes << stats[:shoe]
        end
      end
    end
  end
  biggest_shoe = shoe_sizes.max
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:shoe] == biggest_shoe
            return stats[:rebounds]
          end
        end
      end
    end
  end
end

def most_points_scored
  points_scored = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          points_scored << stats[:points]
        end
      end
    end
  end
  biggest_score = points_scored.max
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:points] == biggest_score
            return player
          end
        end
      end
    end
  end
end

def points_scored(team)
  team_scores = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            team_scores << stats[:points]
          end
        end
      end
    end
  end
  team_scores.inject(:+)
end

def winning_team(team1, team2)
  points_scored(team1) > points_scored(team2) ? team1 : team2
end 

def player_with_longest_name
  player_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          player_names << player
        end
      end
    end
  end
  player_names.inject do |memo, name|
    memo.length > name.length ? memo : name
  end
end

def long_name_steals_a_ton?
  steals_counts = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          steals_counts << stats[:steals]
        end
      end
    end
  end
  most_steals = steals_counts.max
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:steals] == most_steals
            $player_with_most_steals = player
          end
        end
      end
    end
  end
  if $player_with_most_steals == player_with_longest_name
    return true
  else
    return false
  end
end
puts long_name_steals_a_ton?