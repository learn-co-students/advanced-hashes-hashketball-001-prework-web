require 'pry'

def game_hash
  {
  home: {
    team_name: "Brooklyn Nets", 
    colors: ["Black", "White"], 
    players: {
      "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
  away: {
    team_name: "Charlotte Hornets", 
    colors: ["Turquoise", "Purple"], 
    players: {
      "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }

end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == player_name
        return stats[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == player_name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  arr = []
  arr << game_hash[:home][:team_name]
  arr << game_hash[:away][:team_name]
  arr
#   game_hash.collect do |location, team_data|
#     team_data[:team_name]
#   end
# end
end

def player_numbers(team_name)
  arr = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |name, stats|
      arr << stats[:number]
      end
    return arr
    end
  end
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == player_name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  arr = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      arr << stats[:shoe]
    end
    big = arr.max
    team_data[:players].each do |name, stats|
      if stats[:shoe] == big
        return stats[:rebounds]
      end
    end 
  end
end

# def most_points_scored
#   arr = []
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |name, stats|
#       arr << stats[:points]
#     end
#     mostpoints = arr.max
#     team_data[:players].each do |name, stats|
#       if stats[:points] == mostpoints
#         return name
#       end
#     end
#   end
# end

def most_points_scored
  points = []
  game_hash[:home][:players].each do |name, stats|
    points << stats[:points]
  end
  game_hash[:away][:players].each do |name, stats|
    points << stats[:points]
  end
  mostpoints = points.max
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if stats[:points] == mostpoints
        return name
      end
    end
  end
end

def winning_team
  home = []
  away = []
  game_hash[:home][:players].each do |name, stats|
    home << stats[:points]
  end
  game_hash[:away][:players].each do |name, stats|
    away << stats[:points]
  end
  homepoints = home.inject(0, :+)
  awaypoints = away.inject(0, :+)
  if homepoints > awaypoints 
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  arr = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      arr << name.length
    end
  end
  longest = arr.max
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if longest == name.length
        return name
      end
    end
  end
end

def long_name_steals_a_ton?
  arr = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      arr << stats[:steals]
    end
  end
    moststeals = arr.max
    game_hash.each do |location, team_data|
      team_data[:players].each do |name, stats|
      if moststeals == stats[:steals]
        name = name
      end
      if name == player_with_longest_name 
        return true
      else false
      end
    end
  end
end

