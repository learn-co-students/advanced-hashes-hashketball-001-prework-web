require 'pry'

def game_hash
  game_hash = {
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
  game_hash.each do |team, players|
    players[:players].each do |name, info|
      if name == player_name
        return info[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, players|
    players[:players].each do |name, info|
      if name == player_name
        return info[:shoe]
      end
    end
  end
end

def team_colors(team)
  ans = nil
  game_hash.each do |a, b|
    if b[:team_name] == team
      ans = b[:colors]
    end
  end
  ans
end

def team_names
  team_arr = []
  game_hash.each do |home_away, info|
    team_arr << info[:team_name]
  end
  team_arr
end

def player_numbers(team)
  arr = []
  game_hash.each do |home_away, info|
    info[:players].each do |name, other|
      if info[:team_name] == team
        arr << other[:number]
      end
    end
  end
  arr
end

def player_stats(player)
  ans = {}
  game_hash.each do |home_away, info|
    info[:players].each do |name, stats|
      if name == player
        ans = stats
      end
    end
  end
  ans
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0

  game_hash.each do |home_away, info|
    info[:players].each do |name, stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end
