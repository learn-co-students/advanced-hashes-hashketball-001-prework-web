# Write your code here!
require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {"Alan Anderson" =>
          {player_name: "Alan Anderson",
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1}
          },
        {"Reggie Evans" =>
          {player_name: "Reggie Evans",
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7}
          },
        {"Brook Lopez" =>
          {player_name: "Brook Lopez",
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15}
          },
        {"Mason Plumlee" =>
          {player_name: "Mason Plumlee",
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5}
          },
        {"Jason Terry" =>
          {player_name: "Jason Terry",
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1}
          }
        ]
      },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {"Jeff Adrien" =>
          {player_name: "Jeff Adrien",
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2}
          },
        {"Bismak Biyombo" =>
          {player_name: "Bismak Biyombo",
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 7,
            blocks: 15,
            slam_dunks: 10}
          },
        {"DeSagna Diop" =>
          {player_name: "DeSagna Diop",
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5}
          },
        {"Ben Gordon" =>
          {player_name: "Ben Gordon",
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0}
          },
        {"Brendan Haywood" =>
          {player_name: "Brendan Haywood",
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 22,
            blocks: 5,
            slam_dunks: 12}
          }
        ]
      }
    }
end

def num_points_scored(name)
  points = 0
  game_hash.each do |location, data|
    data[:players].each do |player|
      player.each do |player_name, attributes|
        if player_name == name
          points = attributes[:points]
        end
      end
    end
  end
  points
end

def shoe_size(name)
  size = 0
  game_hash.each do |location, data|
    data[:players].each do |player|
      player.each do |player_name, attributes|
        if player_name == name
          size = attributes[:shoe]
        end
      end
    end
  end
  size
end

def team_colors(team)
  colors = []
  game_hash.each do |location, data|
    if data[:team_name] == team
      colors = data[:colors]
    end
  end
  colors
end

def team_names
  names = []
  names = game_hash.collect do |location, data|
    data[:team_name]
  end
  names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, data|
    if data[:team_name] == team
      numbers = data[:players].collect do |player|
        player.collect do |player_name, attributes|
          attributes[:number]
        end
      end
    end
  end
  numbers.flatten.sort
end

def player_stats(name)
  stats = {}
  game_hash.each do |location, data|
    data[:players].each do |player|
      player.each do |player_name, attributes|
        if player_name == name
          stats = attributes
        end
      end
    end
  end
  new_stats = stats.delete_if do |k, v|
    k == :player_name
  end
  new_stats
end

def big_shoe_rebounds
  shoe_sizes = []
  game_hash.each do |location, data|
    data[:players].each do |player|
      shoe_sizes = player.collect do |player_name, attributes|
        attributes[:shoe]
      end
    end
  end
  big_shoes = shoe_sizes.max
  rebounds = 0
  game_hash.each do |location, data|
    data[:players].each do |player|
      player.each do |player_name, attributes|
        if attributes[:shoe] == big_shoes
          rebounds = attributes[:rebounds]
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  points = []
  most_points = 0
  game_hash.each do |location, data|
    points = data[:players].collect do |player|
      player.collect do |player_name, attributes|
        attributes[:points]
      end
    end
  end
  most_points = points.flatten.max
  highest_scorer = ""
  game_hash.each do |location, data|
    data[:players].each do |player|
      player.each do |player_name, attributes|
        if attributes[:points] == most_points
          highest_scorer = attributes[:player_name]
        end
      end
    end
  end
  highest_scorer
end

def winning_team
  points_home = []
  points_away = []
  points_home = game_hash[:home][:players].collect do |player|
    player.collect do |player_name, attributes|
        attributes[:points]
    end
  end
  points_away = game_hash[:away][:players].collect do |player|
    player.collect do |player_name, attributes|
        attributes[:points]
    end
  end
  points_home = points_home.flatten
  points_away = points_away.flatten
  idx = 0
  total_points_home = 0
  while idx < points_home.size
    total_points_home += points_home[idx]
    idx += 1
  end
  idx = 0
  total_points_away = 0
  while idx < points_away.size
    total_points_away += points_away[idx]
    idx += 1
  end
  if total_points_home > total_points_away
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name_lengths = []
  name_lengths = game_hash.collect do |location, data|
    data[:players].collect do |player|
      player.collect do |player_name, attributes|
        player_name
      end
    end
  end
  name_lengths = name_lengths.flatten
  name_lengths.sort! {|a, b| b.length <=> a.length}
  name_lengths[0]
end

def long_name_steals_a_ton?
  name_lengths = []
  name_lengths = game_hash.collect do |location, data|
    data[:players].collect do |player|
      player.collect do |player_name, attributes|
        player_name
      end
    end
  end
  name_lengths = name_lengths.flatten
  name_lengths.sort! {|a, b| b.length <=> a.length}
  name_lengths[0]

  steals = []
  steals = game_hash.collect do |location, data|
    data[:players].collect do |player|
      player.collect do |player_name, attributes|
        attributes[:steals]
      end
    end
  end
  steals = steals.flatten
  most_steals = steals.max
  most_steals_name = ""
  game_hash.each  {|location, data|
    data[:players].each {|player|
      player.each {|player_name, attributes|
        if attributes[:steals] == most_steals
          most_steals_name = attributes[:player_name]
        end
      }
    }
  }
  if name_lengths[0] == most_steals_name
    true
  else
    false
  end
end 