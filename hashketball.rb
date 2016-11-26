require 'pry'

def game_hash
  hash = {
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

def num_points_scored(name_input)
  game_hash.each do |location, team|
    team.each do |team_info, data|
      if team_info == :players
        data.each do |name,stats|
          if name == name_input
            return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name_input)
  game_hash.each do |location, team|
    team.each do |team_info, data|
      if team_info == :players
        data.each do |name,stats|
          if name == name_input
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_input)
  game_hash.each do |location, team|
    team.each do |team_info, data|
      if team_info == :team_name && data == team_input
        return team[:colors]
      end
    end
  end
end

def team_names
  return [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_input)
  return_arr = []
  game_hash.each do |location, team|
    team.each do |team_info, data|
      if data == team_input
        team[:players].each do |name, stats|
          return_arr.push(stats[:number])
        end
      end
    end
  end
  return_arr
end

def player_stats(name_input)
  game_hash.each do |location, team|
    team.each do |category, data|
      if category == :players
        data.each do |name,stats|
          if name == name_input
            return stats
          end
        end
      end
    end
  end
end


def big_shoe_rebounds
  biggest_size = 0
  biggest_players_rebounds = nil
  game_hash.each do |location, team|
    team.each do |category, data|
      if category == :players
        data.each do |name, stats|
          if stats[:shoe] > biggest_size
            biggest_size = stats[:shoe]
            biggest_players_rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  return biggest_players_rebounds
end

def most_points_scored
  most_points = 0
  player_most_points = nil
  game_hash.each do |location, team|
    team.each do |category, data|
      if category == :players
        data.each do |name, stats|
          if stats[:points] > most_points
            most_points = stats[:points]
            player_most_points = name
          end
        end
      end
    end
  end
  return player_most_points
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |location, team|
    team.each do |category, data|
      if category == :players
        data.each do |name, stats|
          if location = :home
            home_points += stats[:points]
          else
            away_points += stats[:points]
          end
        end
      end
    end
  end
  return game_hash[:home][:team_name] if home_points > away_points
  return game_hash[:away][:team_name]
end

def player_with_longest_name
  most_letters = 0
  longest_name = ""
  game_hash.each do |location, team|
    team.each do |category, data|
      if category == :players
        data.each do |name, stats|
          if name.length > most_letters
            longest_name = name
          end
        end
      end
    end
  end
  return longest_name
end

def player_with_most_steals
  most_steals = 0
  player_most_steals = nil
  game_hash.each do |location, team|
    team.each do |category, data|
      if category == :players
        data.each do |name, stats|
          if stats[:steals] > most_steals
            most_steals = stats[:steals]
            player_most_steals = name
          end
        end
      end
    end
  end
  return player_most_steals
end

def long_name_steals_a_ton?
  return true if player_with_most_steals == player_with_longest_name
  return false
end



