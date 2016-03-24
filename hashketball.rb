require 'pry'

# Write your code here!
def game_hash
  game_hash = {
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

def num_points_scored(player)
  points = 0
  game_hash.each do |location, team_data|
    team_stats = 0..(team_data.values.length-1)
    team_attribute = team_data.values
    for i in team_stats
      if ((team_attribute[i].is_a?(Hash)) && (team_attribute[i].key?(player)))
        player_stats = team_attribute[i][player] #returns hash of stats
        points = player_stats["points".to_sym]
      end
    end
  end
  points
end

def shoe_size(player)
  shoe = 0
  game_hash.each do |location, team_data|
    team_stats = 0..(team_data.values.length-1)
    team_attribute = team_data.values

    for i in team_stats
      if ((team_attribute[i].is_a?(Hash)) && (team_attribute[i].key?(player)))
        player_stats = team_attribute[i][player]
        shoe = player_stats["shoe".to_sym]
      end
    end
  end
  shoe
end

def team_colors(team_name)
  colors = []
  game_hash.each do |location, team_data|
    home_or_away = game_hash[location]
    if home_or_away["team_name".to_sym] == team_name
      colors << home_or_away["colors".to_sym]
    end
  end
  colors = colors.flatten
  colors
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    if team_data.key?("team_name".to_sym)
      team_names << team_data["team_name".to_sym]
    end
  end
  team_names.flatten
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    if team_data["team_name".to_sym] == team_name
     players_stats = team_data["players".to_sym].values #this is array of stats hashes
     players_stats.each do |stats_hash_array|
      jersey_numbers << stats_hash_array["number".to_sym]
      end
    end
  end
  jersey_numbers
end

def player_stats(name)
  stats = {}
  game_hash.each do |location, team_data|
    team_data["players".to_sym].each do |player, facts|
      if player==name
        stats = facts
      end
    end
  end 
  stats
end

def big_shoe_rebounds
  big_shoe_player = ""
  big_shoe = 0
  big_shoe_rebounds = 0
  i = 0

  game_hash.each do |location, team_data|
      team_players = team_data["players".to_sym]
      players_names = team_players.keys
      length_players_array = 0..(players_names.length-1)

      for i in length_players_array
        if team_players[players_names[i]]["shoe".to_sym] > big_shoe
          big_shoe = team_players[players_names[i]]["shoe".to_sym]
          big_shoe_player = players_names[i]
          big_shoe_rebounds = team_players[big_shoe_player]["rebounds".to_sym]
        end
      end
  end
  big_shoe_rebounds
end
