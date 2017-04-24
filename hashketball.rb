# Write your code here!
def game_hash
 game_hash = {
   :home => {
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
   :away => {
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
  directory = game_hash
  if !directory[:home][:players][name].nil?
    directory[:home][:players][name][:points].to_i
  else
    directory[:away][:players][name][:points].to_i
  end
end

def shoe_size(name)
  directory = game_hash
  if !directory[:home][:players][name].nil?
    directory[:home][:players][name][:shoe].to_i
  else
    directory[:away][:players][name][:shoe].to_i
  end
end

def team_colors(team)
  directory = game_hash
  if directory[:home][:team_name] == team
    directory[:home][:colors]
  else
    directory[:away][:colors]
  end
end

def team_names
  directory = game_hash
  arr = []
  directory.each do |team, attributes|
    arr << directory[team][:team_name]
  end
  arr
end

def player_numbers(name)
  directory = game_hash
  arr = []
  directory.each do |team, data|
    if directory[team][:team_name] == name
      data.each do |category, name_color_players|
        if category == :players
          name_color_players.each do |player, stats|
            stats.each do |stat, val|
              if stat == :number
                arr << val
              end
            end
          end
        end
      end
    end
  end
  arr.map(&:to_i)
end

def player_stats(name)
  directory = game_hash
  directory.each do |team, data|
    data.each do |category, name_color_players|
      if category == :players
        name_color_players.each do |player, stats|
          return stats if player == name
        end
      end
    end
  end
end

def big_shoe_rebounds
  directory = game_hash
  biggest_shoes = 0
  biggest_shoes_player = ""
  rebounds = 0
  directory.each do |team, data|
    data.each do |category, name_color_players|
      if category == :players
        name_color_players.each do |player, stats|
          stats.each do |stat, value|
            if stat == :shoe && value.to_i > biggest_shoes
              biggest_shoes = value
              biggest_shoes_player = player
            end
          end
        end
      end
    end
  end
  directory.each do |team, data|
    data.each do |category, name_color_players|
      if category == :players
        name_color_players.each do |player, stats|
          stats.each do |stat, value|
            rebounds = value if stat == :rebounds && player == biggest_shoes_player
          end
        end
      end
    end
  end
  rebounds
end
