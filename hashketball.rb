require 'pry'

def game_hash
  {
    :home => { :team_name => "Charlotte Hornets",
               :colors => ["Turquoise", "Purple"],
               :players => [
                 { :player_name => "Jeff Adrien",
                   :number => 4,
                   :shoe => 18,
                   :points => 10,
                   :rebounds => 1,
                   :assists => 1,
                   :steals => 2,
                   :blocks => 7,
                   :slam_dunks => 2
                 },
                 { :player_name => "Bismak Biyombo",
                   :number => 0,
                   :shoe => 16,
                   :points => 12,
                   :rebounds => 4,
                   :assists => 7,
                   :steals => 7,
                   :blocks => 15,
                   :slam_dunks => 10
                 },
                 { :player_name => "DeSagna Diop",
                   :number => 2,
                   :shoe => 14,
                   :points => 24,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 4,
                   :blocks => 5,
                   :slam_dunks => 5
                 },
                 { :player_name => "Ben Gordon",
                   :number => 8,
                   :shoe => 15,
                   :points => 33,
                   :rebounds => 3,
                   :assists => 2,
                   :steals => 1,
                   :blocks => 1,
                   :slam_dunks => 0
                 },
                 { :player_name => "Brendan Haywood",
                   :number => 33,
                   :shoe => 15,
                   :points => 6,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 22,
                   :blocks => 5,
                   :slam_dunks => 12
                 }
               ]
            },
    :away => { :team_name => "Brooklyn Nets",
               :colors => ["Black", "White"],
               :players => [
                 { :player_name => "Alan Anderson",
                   :number => 0,
                   :shoe => 16,
                   :points => 22,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 3,
                   :blocks => 1,
                   :slam_dunks => 1
                 },
                 { :player_name => "Reggie Evans",
                   :number => 30,
                   :shoe => 14,
                   :points => 12,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 12,
                   :blocks => 12,
                   :slam_dunks => 7
                 },
                 { :player_name => "Brook Lopez",
                   :number => 11,
                   :shoe => 17,
                   :points => 17,
                   :rebounds => 19,
                   :assists => 10,
                   :steals => 3,
                   :blocks => 1,
                   :slam_dunks => 15
                 },
                 { :player_name => "Mason Plumlee",
                   :number => 1,
                   :shoe => 19,
                   :points => 26,
                   :rebounds => 12,
                   :assists => 6,
                   :steals => 3,
                   :blocks => 8,
                   :slam_dunks => 5
                 },
                 { :player_name => "Jason Terry",
                   :number => 31,
                   :shoe => 15,
                   :points => 19,
                   :rebounds => 2,
                   :assists => 2,
                   :steals => 4,
                   :blocks => 11,
                   :slam_dunks => 1
                 }
               ]
    }
  }
end

def all_players
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_players.concat(away_players)
end

def player_stats(name)
  # game_hash.each do |homeaway, team|
  #   team[:players].each do |player|
  #     if player[:player_name] == name
  #       return player.select { |stat, value| stat != :player_name }
  #     end
  #   end 
  # end

  # this solution uses the all_players method above
  # and avoids each
  player = all_players.find { |player| player[:player_name] == name }
  player.select { |stat, value| stat != :player_name }
end

def num_points_scored(name)
  game_hash.each do |homeaway, team|
    team[:players].each do |player|
      if player[:player_name] == name
        return player[:points]
      end
    end 
  end
end

def shoe_size(name)
  game_hash.each do |homeaway, team|
    team[:players].each do |player|
      if player[:player_name] == name
        return player[:shoe]
      end
    end 
  end
end

def team_colors(team_name)
  # game_hash.each do |homeaway, team|
  #   if team[:team_name] == team_name
  #     return team[:colors]
  #   end
  # end
  result = game_hash.find do |loc, team_data|
    team_data[:team_name] == team_name
  end
  # parallel assignment
  _l, data = result
  data[:colors]
end

def all_teams
  # home_team = game_hash[:home]
  # away_team = game_hash[:away]
  # [home_team, away_team]
  game_hash.values
end

def team_names
  # my solution
  # team_names = []
  # game_hash.each do |homeaway, team|
  #   team_names << team[:team_name]
  # end
  # team_names

  # better solution
  # game_hash.collect do |_l, team_data|
  #   team_data[:team_name]
  # end

  # map and collect are the same
  all_teams.map do |team|
    team[:team_name]
  end
end

def find_team_by_name(team_name)
  all_teams.find do |team|
    team.has_value?(team_name)
  end
end

def player_numbers(team_name)
  # game_hash.each do |homeaway, team|
  #   if team[:team_name] == team_name
  #     return team[:players].collect { |player| player[:number] }
  #   end
  # end
  team = find_team_by_name(team_name)
  team[:players].map { |player| player[:number] }
end

def big_shoe_rebounds
  # biggest = ["", 0]
  # game_hash.each do |homeaway, team|
  #   team[:players].each do |player|
  #     if player[:shoe] > biggest[1]
  #       biggest = [player[:rebounds], player[:shoe]]
  #     end
  #   end 
  # end
  # biggest[0]
  sorted_players = all_players.sort_by { |player| -player[:shoe] }
  sorted_players.first[:rebounds]
end

def most_points_scored
  all_players.sort_by { |player| -player[:points] }
  all_players.first[:player_name]
end

def winning_team
  sorted_teams = all_teams.sort_by do |team|
    team[:players].map { |player| player[:points] }.reduce(:+)
  end
  sorted_teams.last[:team_name]
end

def player_with_longest_name
  sorted_players = all_players.sort_by { |player| -player[:player_name].length }
  sorted_players.first[:player_name]
end

def long_name_steals_a_ton?
  sorted_players = all_players.sort_by { |player| -player[:steals] }
  sorted_players.first[:player_name] == player_with_longest_name
end

# # Write your code here!
# def game_hash
#   {
#     :home => {
#       :team_name => "Brooklyn Nets",
#       :colors => ["Black", "White"],
#       :players => {
#         :player_name => ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"],
#         :number => [0, 30, 11, 1, 31],
#         :shoe => [16, 14, 17, 19, 15],
#         :points => [22, 12, 17, 26, 19],
#         :rebounds => [12, 12, 19, 12, 2],
#         :assists => [12, 12, 10, 6, 2],
#         :steals => [3, 12, 3, 3, 4],
#         :blocks => [1, 12, 1, 8, 11],
#         :slam_dunks => [1, 7, 15, 5, 1]
#       }
#     },
#     :away => {
#       :team_name => "Charlotte Hornets",
#       :colors => ["Turquoise", "Purple"],
#       :players => {
#         :player_name => ["Jeff Adrien", "Bismak Biyombo", "DeSagna Diop", "Ben Gordon", "Brendan Haywood"],
#         :number => [4, 0, 2, 8, 33],
#         :shoe => [18, 16, 14, 15, 15],
#         :points => [10, 12, 24, 33, 6],
#         :rebounds => [1, 4, 12, 3, 12],
#         :assists => [1, 7, 12, 2, 12],
#         :steals => [2, 7, 4, 1, 22],
#         :blocks => [7, 15, 5, 1, 5],
#         :slam_dunks => [2, 10, 5, 0, 12]
#       }
#     }
#   }
# end

# def player_stat(name, stat)
#   index = nil
#   stat_value = nil
#   game_hash.each do |homeaway, team|
#     index = team[:players][:player_name].find_index(name)
#     if index != nil
#       stat_value = team[:players][stat][index]
#       break
#     end
#   end
#   stat_value
# end

# def num_points_scored(name)
#   player_stat(name, :points)
# end

# def shoe_size(name)
#   player_stat(name, :shoe)
# end

# def team_colors(team_name)
#   game_hash.each do |homeaway, team|
#     if team[:team_name] == team_name
#       return team[:colors]
#     end
#   end
# end

# def team_names
#   names = []
#   game_hash.each do |homeaway, team|
#     names << team[:team_name]
#   end
#   names
# end

# def player_numbers(team_name)
#   game_hash.each do |homeaway, team|
#     if team[:team_name] == team_name
#       return team[:players][:number]
#     end
#   end
# end

# def player_stats(name)
#   index = nil
#   stats = {}
#   game_hash.each do |homeaway, team|
#     index = team[:players][:player_name].find_index(name)
#     if index != nil
#       team[:players].each do |k, v|
#         if k != :player_name then stats[k] = v[index] end
#       end
#       break
#     end
#   end
#   stats
# end

# def big_shoe_rebounds
#   shoe_size = 0
#   max_size = 0
#   rebounds = 0
#   game_hash.each do |homeaway, team|
#     team_max = team[:players][:shoe].max
#     if team_max > max_size
#       max_size = team_max
#       index = team[:players][:shoe].find_index(team_max)
#       rebounds = team[:players][:rebounds][index]
#     end
#   end
#   rebounds
# end