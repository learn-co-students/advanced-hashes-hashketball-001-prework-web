# Write your code here!
# Write your code here!
def game_hash
  game_hash = {
    home:{
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
        }
      },

    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
        }
      }
    }
end

def num_points_scored(name)
  num_points = 0
  game_hash.each do |team, team_stats|
     team_stats.each do |stat, data|
       if stat == :players
         data.each do |player, pstats|
           if player == name then num_points = pstats[:points] end
         end
       end
     end
  end
  num_points
end

def shoe_size(name)
  size = 0
  game_hash.each do |team, team_stats|
     team_stats.each do |stat, data|
       if stat == :players
         data.each do |player, pstats|
           if player == name then size = pstats[:shoe] end
         end
       end
     end
  end
  size
end

#Build a method, team_colors, that takes in an argument of the team
#name and returns an array of that teams colors.
def team_colors(team_name)
  game_hash.each do |team, team_stats|
    if team_stats[:team_name] == team_name
      return team_stats[:colors]
    end
  end
end

#Build a method, team_names, that operates on the game hash to return
#an array of the team names.
def team_names
  team_names = []
  game_hash.each do |team, team_stats|
    team_names << team_stats[:team_name]
  end
  team_names
end

#Build a method, player_numbers, that takes in an argument of a team
#name and returns an array of the jersey number's for that team.
def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |team, team_stats|
    if team_stats[:team_name] == team_name
      team_stats.each do |stat, data|
        data.each {|player, pstats| player_numbers << pstats[:number]} if stat == :players
      end
    end
  end
  player_numbers
end


#Build a method, player_stats, that takes in an argument of a player's
#name and returns a hash of that player's stats. The stat hash should
#not include the player's name.
#player_stats("Alan Anderson")
#=> { :number => 0,
#     :shoe => 16,
#     :points => 22,
#     :rebounds => 12,
#     :assists => 12,
#     :steals => 3,
#     :blocks => 1,
#     :slam_dunks => 1
#   }

def player_stats(name)
  player_stats = {}
  game_hash.each do |team, team_stats|
    team_stats.each do |stat, data|
        if stat == :players
          data.each {|player, pstats| if player == name then player_stats = pstats end}
        end
     end
  end
  player_stats
end

#Build a method, big_shoe_rebounds, that will return the number of rebounds
#associated with the player that has the largest shoe size. Break this
#one down into steps:

def big_shoe_rebounds
  bs_rebound, big_shoe = 0, 0

  game_hash.each do |team, team_stats|
    team_stats.each do |stat, data|
        if stat == :players
          data.each do |player, pstats|
            if pstats[:shoe] > big_shoe
              big_shoe = pstats[:shoe]
              bs_rebound = pstats[:rebounds]
            end
          end
        end
     end
  end
  bs_rebound
end












