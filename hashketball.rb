require 'pry'
def game_hash
{
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

def num_points_scored(name)
  game_hash.each do |location, data|
    return game_hash[location][:players][name][:points] if game_hash[location][:players][name]
  end
end

def shoe_size(name)
  game_hash.each do |location, data|
    return game_hash[location][:players][name][:shoe] if game_hash[location][:players][name]
  end
end

def team_colors(team)
  game_hash.each do |location, data|
    return game_hash[location][:colors] if game_hash[location][:team_name][team]
  end
end

def team_names
  game_hash.collect{|location, data| data[:team_name]}
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, data|
    if game_hash[location][:team_name] == team
      data[:players].each do |player, stats|
        numbers << stats[:number]
      end
    end
  end
  numbers
end

def player_stats(player)
  game_hash.each do |location, data|
    return data[:players][player] if data[:players][player]
  end
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, data|
    data[:players].each do |player, stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  name = ""
  game_hash.each do |location, data|
    data[:players].each do |player, stats|
      if stats[:points] > points
        points = stats[:points]
        name = player
      end
    end
  end
  name
end

def winning_team
  home = 0
  away = 0
  game_hash[:home][:players].each do |player, stats|
    home += stats[:points]
  end
  game_hash[:away][:players].each do |player, stats|
    away += stats[:points]
  end
  home > away ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, data|
    data[:players].keys.each do |name|
      longest_name = name if name.length > longest_name.length
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  steals_name = ""
  game_hash.each do |location, data|
    data[:players].each do |player, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        steals_name = player
      end
    end
  end
  steals_name == player_with_longest_name ? true : false
end