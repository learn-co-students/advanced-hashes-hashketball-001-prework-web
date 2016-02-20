# Write your code here!
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
      :team_name  =>"Charlotte Hornets",
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

def num_points_scored(name)
  game_hash[:home][:players].each do |a, b|
    if name == a
      return game_hash[:home][:players][a][:points]
    end
  end

  game_hash[:away][:players].each do |c, d|
    if name == c
      return game_hash[:away][:players][c][:points]
    end
  end
end

def shoe_size(name)
  game_hash[:home][:players].each do |a, b|
    if name == a
      return game_hash[:home][:players][a][:shoe]
    end
  end

  game_hash[:away][:players].each do |c, d|
    if name == c
      return game_hash[:away][:players][c][:shoe]
    end
  end
end

def team_colors(name)
  game_hash.each do |team, info|
    info.each do |a, b|
      if name == b.to_s
        return game_hash[team][:colors]
      end
    end
  end
end

def team_names
  #return array of team names
  array = []
  game_hash.each do |x, y|
    game_hash[x].each do |a, b|
      if a == :team_name
        array << b
      end
    end
  end
  array
end

def player_numbers(team_name)
  #first create 2 arrays, 1 for each teams numbers
  #if team_name = this return this' numbers
  nets_array = []
  hornets_array = []
  game_hash[:home][:players].each do |x, y|
    y.each do |a, b|
      if a == :number
        nets_array << b
      end
    end
  end
  game_hash[:away][:players].each do |c, d|
    d.each do |e, f|
      if e == :number
        hornets_array << f
      end
    end
  end
  if team_name == "Brooklyn Nets"
    nets_array
  elsif team_name == "Charlotte Hornets"
    hornets_array
  end
end

def player_stats(player)
  game_hash[:home][:players].each do |a, b|
    if player == a
      return b
    end
  end
  game_hash[:away][:players].each do |c, d|
    if player == c
      return d
    end
  end
end

def big_shoe_rebounds
  first = game_hash[:home][:players]["Alan Anderson"][:shoe]
  biggest = nil
  game_hash[:home][:players].each do |a, b|
    b.each do |c, d|
      if c == :shoe && d > first
        first = d
        biggest = b[:rebounds]
      end
    end
  end
  game_hash[:away][:players].each do |e, f|
    f.each do |g, h|
      if g == :shoe && h > first
        first = h
        biggest = f[:rebounds]
      end
    end
  end
  biggest
end

