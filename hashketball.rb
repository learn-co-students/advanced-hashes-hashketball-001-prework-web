require 'pry'
# Write your code here!

def make_player (name,number,shoe,points,rebounds,assists,steals,blocks,slam_dunks)
  your_player = {
    :player_name => name,
    :number => number,
    :shoe => shoe,
    :points => points,
    :rebounds => rebounds,
    :assists => assists,
    :steals => steals,
    :blocks => blocks,
    :slam_dunks => slam_dunks
  }
end

def game_hash
  the_game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [
        make_player("Alan Anderson", 0,16,22,12,12,3,1,1),
        make_player("Reggie Evans", 30,14,12,12,12,12,12,7),
        make_player("Brook Lopez", 11,17,17,19,10,3,1,15),
        make_player("Mason Plumlee", 1,19,26,12,6,3,8,5),
        make_player("Jason Terry", 31,15,19,2,2,4,11,1)
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Purple", "Turquoise"],
      :players => [
        make_player("Jeff Adrien",4,18,10,1,1,2,7,2),
        make_player("Bismak Biyombo",0,16,12,4,7,7,15,10),
        make_player("DeSagna Diop",2,14,24,12,12,4,5,5),
        make_player("Ben Gordon",8,15,33,3,2,1,1,0),
        make_player("Brendan Haywood",33,15,6,12,12,22,5,12)
      ]
    }
  }
  the_game
end

def num_points_scored (name)
  game_hash.each do |side,team_data|
    team_data[:players].each do |data|
      if data[:player_name] == name
        return data[:points]
      end
    end
  end
  return "Player not found"
end

def num_rebounds (name)
  game_hash.each do |side,team_data|
    team_data[:players].each do |data|
      if data[:player_name] == name
        return data[:rebounds]
      end
    end
  end
  return "Player not found"
end

def shoe_size (name)
  game_hash.each do |side,team_data|
    team_data[:players].each do |data|
      if data[:player_name] == name
        return data[:shoe]
      end
    end
  end
  return "Player not found"
end

def team_colors (team_name)
  game_hash.each do |side,team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
  puts "Team not found"
end

def team_names
  return_array =[]
  game_hash.each do |side,team_data|
    return_array << team_data[:team_name]
  end
  return_array
end

def player_numbers (team_name)
  return_array = []
  game_hash.each do |side,team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |data|
        return_array << data[:number]
      end
    end
  end
  return_array
end

def player_stats (name)
  return_hash = {}
  game_hash.each do |side,team_data|
    team_data[:players].each do |data|
      if data[:player_name] == name
        return_hash = data
        return_hash.delete(:player_name)
      end
    end
  end
  return_hash
end

def big_shoe_rebounds 
  biggest_shoe = 0
  big_player = ""
  game_hash.each do |side,team_data|
    team_data[:players].each do |data|
      if biggest_shoe < data[:shoe]
        biggest_shoe = data[:shoe]
        big_player = data[:player_name]
      end
    end
  end
  return num_rebounds(big_player)
end




