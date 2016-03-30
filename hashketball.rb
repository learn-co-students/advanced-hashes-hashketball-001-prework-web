require 'pry'
require 'benchmark'

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

def find_player(name)
  players = game_hash[:home][:players].merge(game_hash[:away][:players])
  players.fetch(name)
end

def find_team(which_team)
  selected_team = game_hash.values.select { |team| team[:team_name] == which_team }[0]
end

def num_points_scored(name)
  player = find_player(name)
  player.fetch(:points)
end

def shoe_size(name)
  player = find_player(name)
  player.fetch(:shoe)
end

def team_colors(which_team)
  team = find_team(which_team)
  team.fetch(:colors)
end

def team_names
  game_hash.keys.map { |team| game_hash[team][:team_name] }
end

def player_numbers(which_team)
  team = find_team(which_team)
  team[:players].keys.map { |player| team[:players][player][:number] }
end

def player_stats(name)
  find_player(name)
end

def big_shoe_rebounds
  players = game_hash[:home][:players].merge(game_hash[:away][:players])
  rebounds = 0
  biggest_foot = players.each_with_object(0) do |(player, stats), size|
    size = stats[:shoe], rebounds = stats[:rebounds] if stats[:shoe] > size
  end
  rebounds
end

# BONUS

def most_points_scored
    most_points = 0
    mvp = ""
    game_hash.keys.each do |team|
        game_hash[team][:players].keys.each do |player|
            if game_hash[team][:players][player][:points] > most_points
                most_points = game_hash[team][:players][player][:points]
                mvp = player
            end
        end
    end
    mvp
end

def winning_team
    point_totals = []

    game_hash.keys.each do |team|
        points = 0
        game_hash[team][:players].keys.each do |player|
            points +=  game_hash[team][:players][player][:points]
        end
        point_totals << points
    end

    if point_totals[0] > point_totals[1]
        game_hash[:home][:team_name]
    elsif point_totals[0] < point_totals[1]
        game_hash[:away][:team_name]
    else
        "Teams are tied"
    end
end

def player_with_longest_name
    longest_name = ""
    name_length = 0
    game_hash.keys.each do |team|
        game_hash[team][:players].keys.each do |player|
            if player.length > name_length
                name_length = player.length
                longest_name = player
            end
        end
    end
    longest_name
end

def long_name_steals_a_ton?
    most_steals = 0
    mvp = ""
    game_hash.keys.each do |team|
        game_hash[team][:players].keys.each do |player|
            if game_hash[team][:players][player][:steals] > most_steals
                most_steals = game_hash[team][:players][player][:steals]
                mvp = player
            end
        end
    end
    return true if mvp == player_with_longest_name
end

# def num_points_scored(name)
#   game_hash.keys.each do |loc|
#     game_hash[loc][:players].keys.each do |player|
#         return game_hash[loc][:players][player][:points] if player == name
#     end
#   end
# end

# def shoe_size(name)
  # game_hash.keys.each do |loc|
  #   game_hash[loc][:players].keys.each do |player|
  #     return game_hash[loc][:players][player][:shoe] if player == name
  #   end
  # end
# end

# def team_colors(which_team)
# game_hash.keys.each do |team|
#   return game_hash[team][:colors] if game_hash[team][:team_name] == which_team
# end
# end

# def player_numbers(which_team)
#   numbers = []
#   game_hash.keys.each do |team|
#       if game_hash[team][:team_name] == which_team
#           game_hash[team][:players].keys.each do |player|
#               numbers << game_hash[team][:players][player][:number]
#           end
#       end
#   end
#   numbers
# end

# def player_stats(name)
#     game_hash.keys.each do |team|
#         game_hash[team][:players].keys.each do |player|
#             return game_hash[team][:players][name] if player == name
#         end
#     end
# end

# def big_shoe_rebounds
#     biggest_shoe = 0
#     biggest_foot = ""
#     team = ""
#     game_hash.keys.each do |loc|
#         game_hash[loc][:players].keys.each do |player|
#             if game_hash[loc][:players][player][:shoe] > biggest_shoe
#                 biggest_shoe = game_hash[loc][:players][player][:shoe]
#                 biggest_foot = player
#                 team = loc
#             end
#         end
#     end
#     game_hash[team][:players][biggest_foot][:rebounds]
# end
