require "pry"

def game_hash
  game_hash =
  {
    :home => 
    {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players =>
      {
        "Alan Anderson" =>
        {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" =>
        {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" =>
        {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" =>
        {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" =>
        {
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
    :away => 
    {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>
      {
        "Jeff Adrien" =>
        {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" =>
        {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" =>
        {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" =>
        {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" =>
        {
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
  if game_hash[:home][:players][player_name] != nil
    return game_hash[:home][:players][player_name][:points]
  elsif game_hash[:away][:players][player_name] != nil
    return game_hash[:away][:players][player_name][:points]
  else
    return "wrong player name"
  end
end


def shoe_size(player_name)
  if game_hash[:home][:players][player_name] != nil
    return game_hash[:home][:players][player_name][:shoe]
  elsif game_hash[:away][:players][player_name] != nil
    return game_hash[:away][:players][player_name][:shoe]
  else
    return "wrong player name"
  end
end


def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    return game_hash[:away][:colors]
  else
    return "wrong team name"
  end
end


def team_names
  team_names = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  numbers = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |player, attributes|
      numbers << attributes[:number]
    end    
  elsif game_hash[:away][:team_name] == team
    game_hash[:away][:players].each do |player, attributes|
      numbers << attributes[:number]
    end
  else
    return "wrong team name"
  end
  numbers
end


def player_stats(player_name)
  if game_hash[:home][:players][player_name] != nil
    return game_hash[:home][:players][player_name]
  elsif game_hash[:away][:players][player_name] != nil
    return game_hash[:away][:players][player_name]
  else
    return "wrong player name"
  end
end


def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |location, data|
    data[:players].each do |name, stats|
      if biggest_shoe < stats[:shoe]
        biggest_shoe = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end


#bonus
def most_points_scored
  most_points = 0
  game_hash.each do |location, data|
    data[:players].each do |name, stats|
      most_points = stats[:points] if most_points < stats[:points]
    end
  end
  most_points
end


def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each {|name, stats| home_points += stats[:points]}
  game_hash[:away][:players].each {|name, stats| away_points += stats[:points]}
  if home_points > away_points
    return game_hash[:home][:team_name]
  elsif home_points < away_points
    return game_hash[:away][:team_name]
  else
    return "tie"
  end
end


def player_with_longest_name
  name_length = 0
  longest_name = ""
  game_hash.each do |location, data|
    data[:players].each do |name, stats|
      if name.length > name_length
        name_length = name.length
        longest_name = name
      end
    end
  end
  longest_name
end


def long_name_steals_a_ton?
  longest_name_steals = 0
  if game_hash[:home][:players][player_with_longest_name] != nil
    longest_name_steals = game_hash[:home][:players][player_with_longest_name][:steals]
  else
    longest_name_steals = game_hash[:away][:players][player_with_longest_name][:steals]
  end

  game_hash.each do |location, data|
    data[:players].each do |name, stats|
      return false if longest_name_steals < stats[:steals]
    end
  end
  true
end  









