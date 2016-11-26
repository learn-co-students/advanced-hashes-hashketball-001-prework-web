require 'pry'
require 'byebug'
def game_hash
  hash = {
    :home => {
      team_name: "Brooklyn Nets" ,
      colors: ["Black", "White"],
      players: {
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
        "Brook Lopez" =>   {
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
      team_name: "Charlotte Hornets",
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

def num_points_scored(player)
  if game_hash[:home][:players].keys.include?(player)
    game_hash[:home][:players][player][:points]
  elsif game_hash[:away][:players].keys.include?(player)
    game_hash[:away][:players][player][:points]
  else
    nil
  end
end

def shoe_size(player)
  if game_hash[:home][:players].keys.include?(player)
    game_hash[:home][:players][player][:shoe]
  elsif game_hash[:away][:players].keys.include?(player)
    game_hash[:away][:players][player][:shoe]
  else
    nil
  end
end

def team_colors(team)
  if game_hash[:home].values.include?(team)
    game_hash[:home][:colors]
  elsif game_hash[:away].values.include?(team)
    game_hash[:away][:colors]
  else
    nil
  end
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  numbers = []

  if game_hash[:home].values.include?(team)
    game_hash[:home][:players].each do |player, stats_h|
      stats_h.each do |stat, value|
        numbers << value if stat == :number
      end
    end
  elsif game_hash[:away].values.include?(team)
    game_hash[:away][:players].each do |player, stats_h|
      stats_h.each do |stat, value|
        numbers << value if stat == :number
      end
    end
  else
    nil
  end
  numbers
end

def player_stats(player)
  if game_hash[:home][:players].keys.include?(player)
    game_hash[:home][:players][player]
  elsif game_hash[:away][:players].keys.include?(player)
    game_hash[:away][:players][player]
  else
    nil
  end
end

def big_shoe_rebounds
  biggest = 0
  player = nil

  game_hash[:home][:players].each do |name, stats_h|
    stats_h.each do |stat, value|
      if stat == :shoe && value > biggest
        biggest = value
        player = name
      end
    end
  end

  game_hash[:home][:players].each do |name, stats_h|
    stats_h.each do |stat, value|
      if stat == :shoe && value > biggest
        biggest = value
        player = name
      end
    end
  end

  if game_hash[:home][:players].keys.include?(player)
    game_hash[:home][:players][player][:rebounds]
  elsif game_hash[:away][:players].keys.include?(player)
    game_hash[:away][:players][player][:rebounds]
  else
    nil
  end
end


def good_practices(name)
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |p_name, stat_h|
            stat_h.each do |stat, value|
              if p_name == name && stat == :steals
                return value
              end
            end
          end
        end
      end
  end
end
# 1 big iteration practice 
#p good_practices("Brendan Haywood")
