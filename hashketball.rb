
# Write your code here!
def game_hash #generate hash
  game = {
    home: {team_name: "Brooklyn Nets", colors: ["Black", "White"], players:
      [
       "Alan Anderson" =>
       {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
       },
        "Reggie Evans" =>
       {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
        },
        "Brook Lopez" =>
       {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
        },
        "Mason Plumlee" =>
       {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
        },
        "Jason Terry" =>
       {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
        }
      ]},
    away: {team_name: "Charlotte Hornets", colors: ["Turquoise", "Purple"],     players:
      [
        "Jeff Adrien" =>
       {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
       },
       "Bismak Biyombo" =>
       {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
       },
        "DeSagna Diop" =>
       {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
       },
       "Ben Gordon" =>
       {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
       },
       "Brendan Haywood" =>
       {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
       }
      ]},
  }
  game
end

def num_points_scored(name) #return points scored by player
  return game_hash[:home][:players][0][name][:points] if game_hash[:home][:players][0].keys.include?(name)
  return game_hash[:away][:players][0][name][:points] if game_hash[:away][:players][0].keys.include?(name)
end

def shoe_size(name) #return shoesize of player
  return game_hash[:home][:players][0][name][:shoe] if game_hash[:home][:players][0].keys.include?(name)
  return game_hash[:away][:players][0][name][:shoe] if game_hash[:away][:players][0].keys.include?(name)
end

def team_colors(name) #return team colors of team
  return game_hash[:home][:colors] if game_hash[:home][:team_name]==(name)
  return game_hash[:away][:colors] if game_hash[:away][:team_name]==(name)
end

def team_names #get array containing all teams
  teams = []
  game_hash.each do |team, info|
    teams << info[:team_name]
  end
  teams
end

def player_numbers(team_name) #get array of player numbers for a team
  numbers = []
  game_hash.each do |team, info|
    if(info[:team_name]==team_name)
      info[:players][0].each do |name, stats|
        numbers << stats[:number]
      end
    end
  end
  numbers
end

def player_stats(name) #get player stats of player
  return game_hash[:home][:players][0][name] if game_hash[:home][:players][0].keys.include?(name)
  return game_hash[:away][:players][0][name] if game_hash[:away][:players][0].keys.include?(name)
end

def big_shoe_rebounds
  big_foot = nil
  big_foot_team = nil
  game_hash.each do |team, info|
    info[:players][0].each do |player, stats|
      if(big_foot==nil)
        big_foot = player
        big_foot_team = team
      elsif game_hash[team][:players][0][player][:shoe] > game_hash[big_foot_team][:players][0][big_foot][:shoe]
        big_foot = player
        big_foot_team = team
      end
    end
  end

  player_stats(big_foot)[:rebounds]
end

def most_points_scored
  most = nil
  most_team = nil
  game_hash.each do |team, info|
    info[:players][0].each do |player, stats|
      if(most==nil)
        most = player
        most_team = team
      elsif game_hash[team][:players][0][player][:points] > game_hash[most_team][:players][0][most][:points]
        most = player
        most_team = team
      end
    end
  end
  most
end

def winning_team
  points_h = 0
  points_a = 0
  game_hash.each do |team, info|
    info[:players][0].each do |player, stats|
      if(team == :home)
        points_h += game_hash[team][:players][0][player][:points]
      else
        points_h += game_hash[team][:players][0][player][:points]
      end
    end
  end

  if(points_h > points_a)
    game_hash[:home][:team_name]
  elsif(points_a < points_h)
    game_hash[:away][:team_name]
  else
    "Tie"
  end
end

def player_with_longest_name
  longest= nil
  game_hash.each do |team, info|
    info[:players][0].keys.each do |player|
      if(longest==nil)
        longest = player
      elsif player.size > longest.size
        longest = player
      end
    end
  end
  longest
end

def long_name_steals_a_ton?
  longest = player_with_longest_name
  steals = 0
  steals = game_hash[:home][:players][0][longest][:steals] if game_hash[:home][:players][0].keys.include?(longest)
  steals = game_hash[:away][:players][0][longest][:steals] if game_hash[:away][:players][0].keys.include?(longest)
  max_steals = steals
  game_hash.each do |team, info|
    info[:players][0].each do |player, stats|
      if game_hash[team][:players][0][player][:steals] > max_steals
        max_steals = game_hash[team][:players][0][player][:steals]
      end
    end
  end
  if(steals>=max_steals)
    true
  else
    false
  end
end






