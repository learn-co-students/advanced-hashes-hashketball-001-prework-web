# Write your code here!
require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22,
          rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12,
            rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17,
              rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26,
                rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19,
          rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10,
          rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12,
            rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24,
              rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33,
                rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6,
          rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
  game_hash
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end


###REFACTORING CODE HERE
def fetch_all_players_in_a_game  #Returns a merged array of only player data
  #WARNING... This method assumes that there are no players with the exact same name!
  all_players = game_hash.collect {|_, data| data[:players]}
  all_players[0].merge(all_players[1])
end

def fetch_all_players_in_a_team(team_name)
    game_hash.collect do |_, data|
    data[:players] if data[:team_name] == team_name
  end.compact[0]
end

def player_stats(player_name)
   fetch_all_players_in_a_game[player_name]
end

def num_points_scored(player_name)
   player_stats(player_name)[:points]
end

def shoe_size(player_name)
  player_stats(player_name)[:shoe]
end

def team_colors(team_name)
  game_hash.collect do |_, data|
    data[:colors] if data[:team_name] == team_name
  end.compact!.flatten!
end

def team_names
  game_hash.collect {|_, data| data[:team_name]}
end

 def player_numbers(team_name)
   fetch_all_players_in_a_team(team_name).collect {|_, stats| stats[:number]}
 end


###FIRST SOLUTIONS HERE

# def num_points_scored(player_name)
#   correct_level = {}
#   game_hash.each do |team, value|
#     value.each do |item, data|
#       if item == :players
#         data.each do |player, stats|
#           if player == player_name
#             correct_level = stats
#           end
#         end
#       end
#     end
#   end
#   if correct_level == {}
#     puts "Player #{player_name} not found!"
#   else
#     correct_level[:points]
#   end
# end


# def shoe_size(player_name)
#   correct_level = {}
#   game_hash["players"]
#   game_hash.each do |team, value|
#     value.each do |item, data|
#       if item == :players
#         data.each do |player, stats|
#           if player == player_name
#             correct_level = stats
#           end
#         end
#       end
#     end
#   end
#   if correct_level == {}
#     puts "Player #{player_name} not found!"
#   else
#     correct_level[:shoe]
#   end
# end

# def team_colors(team_name)
#   colors = []
#   game_hash.each do |team, value|
#     if value[:team_name] == team_name
#       colors = value[:colors]
#     end
#   end
#   if colors == []
#     puts "Unknown team!"
#   else
#     colors
#   end
# end

# def team_names
#   team_names = []
#   game_hash.each do |team, value|
#     team_names << value[:team_name]
#   end
#   team_names
# end

# def player_numbers(team_name)
#   jerseys = []
#   game_hash.each do |team, value|
#     if value[:team_name] == team_name
#       value.each do |item, data|
#         if item == :players
#           data.each do |player, stats|
#             jerseys << stats[:number]
#           end
#         end
#       end
#     end
#   end
#   if jerseys == []
#     puts "Unknown team!"
#   else
#     jerseys
#   end
# end

# def player_stats(player_name)
#   correct_level = {}
#   game_hash.each do |team, value|
#     value.each do |item, data|
#       if item == :players
#         data.each do |player, stats|
#           if player == player_name
#             correct_level = stats
#           end
#         end
#       end
#     end
#   end
#   if correct_level == {}
#     puts "Player #{player_name} not found!"
#   else
#     correct_level
#   end
# end

def largest_shoe_size
  biggest_shoe = -1
  player_name = ""
  team_tag = ""
  game_hash.each do |team, value|
    value.each do |item, data|
      if item == :players
        data.each do |player, stats|
          if stats[:shoe] > biggest_shoe
            player_name = player
            team_tag = team
          end
        end
      end
    end
  end
  {t: team_tag, p: player_name}
end

def big_shoe_rebounds
  shoe_stats = largest_shoe_size
  game_hash[shoe_stats[:t]][:players][shoe_stats[:p]][:rebounds]
end

def most_points_scored
  max_points = -1
  player_name = ""
  game_hash.each do |team, value|
    value.each do |item, data|
      if item == :players
        data.each do |player, stats|
          if num_points_scored(player) > max_points
            player_name = player
            max_points = num_points_scored(player)
          end
        end
      end
    end
  end
  player_name
end

def winning_team
  winning_team = ""
  max_score = 0
  game_hash.each do |team, value|
    team_score = 0
    value.each do |item, data|
      if item == :players
        data.each do |player, stats|
          team_score += num_points_scored(player)
        end
      end
    end
    if team_score > max_score
      winning_team = value[:team_name]
      max_score = team_score
    end
  end
  winning_team
end

def player_with_longest_name
  max_name_length = 0
  player_name = ""
  game_hash.each do |team, value|
    value.each do |item, data|
      if item == :players
        data.each do |player, stats|
          if player.length > max_name_length
            player_name = player
            max_name_length = player.length
          end
        end
      end
    end
  end
  player_name
end

def most_steals
  max_steals = 0
  player_name = ""
  game_hash.each do |team, value|
    value.each do |item, data|
      if item == :players
        data.each do |player, stats|
          if stats[:steals] > max_steals
            player_name = player
            max_steals = stats[:steals]
          end
        end
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  player_with_longest_name == most_steals
end
