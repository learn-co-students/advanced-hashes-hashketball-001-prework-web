require 'pry'

def game_hash
  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      :players => {
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
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      :players => {
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

def num_points_scored(name)
  points = nil
  game_hash.each do |team, attributes|
    game_hash[team][:players].each do |key, value|
      if name == key
        points = game_hash[team][:players][name][:points]
      end
    end
  end
  points
end

def shoe_size(name)
  shoe = nil
  game_hash.each do |team, attributes|
    game_hash[team][:players].each do |key, value|
      if name == key
        shoe = game_hash[team][:players][name][:shoe]
      end
    end
  end
  shoe
end

def team_colors(team_name)
  color_array = []
  game_hash.each do |team, attributes|
    if game_hash[team][:team_name] == team_name
      color_array = game_hash[team][:colors]
    end
  end
  color_array
end

def team_names
  team_names_array = []
  game_hash.each do |team, attributes|
    team_names_array << game_hash[team][:team_name]
  end
  team_names_array
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |team, attributes|
    game_hash[team].each do |attribute, value|
      if value == team_name
        game_hash[team][:players].each do |name, stats|
          game_hash[team][:players][name].each do |stat, val|
            if stat == :number
              player_numbers << val
            end
          end
        end
      end
    end
  end
  player_numbers
end

def player_stats(player)
  stats_hash = {}
  game_hash.each do |team, attributes|
    game_hash[team].each do |attribute, value|
      if attribute == :players
        game_hash[team][:players].each do |name, stats|
          if name == player
            stats_hash = game_hash[team][:players][name]
          end
        end
      end
    end
  end
  stats_hash
end

def big_shoe_rebounds
  biggest_shoe = 0
  player_w_biggest_shoe = nil
  player_rebounds = nil
  game_hash.each do |team, attributes|
    game_hash[team].each do |attribute, value|
      if attribute == :players
        game_hash[team][:players].each do |player, stats|
          game_hash[team][:players][player].each do |stat, val|
            if stat == :shoe && val > biggest_shoe
              biggest_shoe = val
              player_w_biggest_shoe = player
            end
          end
          if player == player_w_biggest_shoe
            player_rebounds = game_hash[team][:players][player][:rebounds]
          end
        end
      end
    end
  end
  player_rebounds
end
