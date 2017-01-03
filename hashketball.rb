# Write your code here!
require 'pry'
def game_hash
  hash = {}
  hash[:home] = {
           team_name: "Brooklyn Nets",
           colors: ["Black", "White"],
           }
  hash[:home][:players] = {
    "Alan Anderson" => {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1,
           },
           "Reggie Evans" => {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7,
           },
           "Brook Lopez" => {
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15,
           },
           "Mason Plumlee" => {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5,
           },
           "Jason Terry" => {
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1,
           }
  }

  hash[:away] = {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    }
  hash[:away][:players] = {
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
        
        hash 
end

def num_points_scored(player)
  return game_hash[:home][:players][player][:points] if game_hash[:home][:players].keys.include?(player)
  return game_hash[:away][:players][player][:points] if game_hash[:away][:players].keys.include?(player)
end

def shoe_size(player)
  return game_hash[:home][:players][player][:shoe] if game_hash[:home][:players].keys.include?(player)
  return game_hash[:away][:players][player][:shoe] if game_hash[:away][:players].keys.include?(player)
end

def team_colors(team)
  return game_hash[:home][:colors] if game_hash[:home][:team_name] == team
  return game_hash[:away][:colors] if game_hash[:away][:team_name] == team
end

def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
  teams
end

def player_numbers(team)
  jersey_numbers = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |player, attribute|
      jersey_numbers << attribute[:number]
    end
  end
  if game_hash[:away][:team_name] == team
    game_hash[:away][:players].each do |player, attribute|
      jersey_numbers << attribute[:number]
    end
  end
  jersey_numbers
end

def player_stats(player)
  return game_hash[:home][:players][player] if game_hash[:home][:players].keys.include?(player)
  return game_hash[:away][:players][player] if game_hash[:away][:players].keys.include?(player)
end

def big_shoe_rebounds
  all_players = {}
  all_players.merge!(game_hash[:home][:players])
  all_players.merge!(game_hash[:away][:players])
  largest_shoe = 0
  player_name = ""
  all_players.each {|player, attributes| player_name, largest_shoe = player, attributes[:shoe] if attributes[:shoe] > largest_shoe}
  all_players[player_name][:rebounds]
end





