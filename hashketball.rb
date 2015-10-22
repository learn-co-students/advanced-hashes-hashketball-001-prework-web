require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:
        [{ player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1 },
        { player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7 },
        { player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15 },
        { player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5 },
        { player_name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1 }]
      },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:
     [{ player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2 },
      { player_name: "Bismak Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10 },
      { player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5 },
      { player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0 },
      { player_name: "Brendan Haywood",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12 }]
      }
    }
end

def num_points_scored(name)
  game_hash.each do |team, data|
    data[:players].each do |player_data|
      return player_data[:points] if player_data[:player_name] == name
    end
  end
  puts "Player not found."
end

def shoe_size(name)
  game_hash.each do |team, data|
    data[:players].each do |player_data|
      return player_data[:shoe] if player_data[:player_name] == name
    end
  end
  puts "Player not found."
end

def team_colors(team_name)
  game_hash.each do |team, data|
    return data[:colors] if data[:team_name] == team_name
  end
  puts "Team not found."
end

def team_names
  game_hash.collect {|team, data| data[:team_name]}
end

def player_numbers(team_name)
  game_hash.collect {|team, data| data[:players].collect {|stats| stats[:number]} if data[:team_name] == team_name}.compact.flatten
end

def player_stats(player_name)
  just_stats = game_hash.collect {|team, data| data[:players]}.flatten.select {|stats| stats[:player_name] == player_name}[0]
  just_stats.delete(:player_name)
  just_stats
end

def big_shoe_rebounds
  player_with_biggest_shoe = {shoe: 0}
  game_hash.each do |team, data|
    data[:players].each do |stats|
      player_with_biggest_shoe = stats if stats[:shoe] > player_with_biggest_shoe[:shoe]
    end
  end
  player_with_biggest_shoe[:rebounds]
end

def most_points_scored
  most_points_scored = {points: 0}
  game_hash.each do |team, data|
    data[:players].each do |stats|
      most_points_scored = stats if stats[:points] > most_points_scored[:points]
    end
  end
  most_points_scored[:player_name]
end

def winning_team
  winning_team = ""
  most_points = 0
  game_hash.each do |team, data|
    points = data[:players].inject(0) {|total, stats| total += stats[:points]}
    if points > most_points
      most_points = points
      winning_team = data[:team_name]
    end
  end
  winning_team
end

def player_with_longest_name
  player_names = game_hash.collect {|team, data| data[:players].collect {|stats| stats[:player_name]}}.flatten
  player_names.sort_by {|name| name.length}.last
end

def long_name_steals_a_ton?
  player_with_most_steals = {steals: 0}
  game_hash.each do |team, data|
    data[:players].each do |stats|
      player_with_most_steals = stats if stats[:steals] > player_with_most_steals[:steals]
    end
  end
  return true if player_with_most_steals[:player_name] == player_with_longest_name
  false
end