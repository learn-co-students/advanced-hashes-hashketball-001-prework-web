#require 'pry'
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {player_name: "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12, 
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
        {player_name: "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12, 
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
        {player_name: "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10, 
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
        {player_name: "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6, 
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
        {player_name: "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2, 
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}        
      ] 
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1, 
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
        {:player_name => "Bismak Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7, 
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10},
        {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12, 
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
        {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2, 
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
        {:player_name => "Brendan Haywood",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12, 
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12}
      ]
    }
  }
end

#Innitially tried this but too complicated looking. Dat code smells!
#def num_points_scored(that_guy)
#    game_hash.each do |location, team_data|
#        team_data.each do |attribute, data|
#            if attribute == :players 
#                data.each do |player|
#                    if player[:player_name] == that_guy
#                    return player[:num_points_scored]
#                    end
#                end
#            end
#        end
#    end
#end

#second try with this new method to collect info on all players
def all_players(game_hash)
    all_players = Hash.new
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |player|
                    all_players[player[:player_name]] = player
                end
            end
        end
    end
    all_players
end

def num_points_scored(that_guy)
    all_players(game_hash)[that_guy][:points]
end


def shoe_size(that_guy)
    all_players(game_hash)[that_guy][:shoe]
end

def team_colors(that_team)
    game_hash.each do |location, team|
        if team[:team_name] == that_team
           return team[:colors]
        end
    end
end

def team_names
  game_hash.collect do |location, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
    game_hash.each do |location, team|
        if team[:team_name] == team_name
            return team[:players].collect do |player|
                player[:number]
            end
        end
    end
end

def player_stats(that_guy)
    all_players(game_hash)[that_guy].delete_if{|key, value| key == :player_name}
end

def big_shoe_rebounds
    biggest_feet = all_players(game_hash).collect do |name, stats|
        stats[:shoe]
    end.max
    all_players(game_hash).each do |name, stats|
        if stats[:shoe] == biggest_feet
            return stats[:rebounds]
        end
    end
end

#Bonus Round:

def most_points_scored
    most_points = all_players(game_hash).collect do |name, stats|
        stats[:points]
    end.max
    all_players(game_hash).each do |name, stats|
        if stats[:points] == most_points
            return stats[:player_name]
        end
    end
end

def winning_team
    all_points_home = game_hash[:home][:players].collect do |player|
        player[:points]
        end
    sum_point_home = 0
    all_points_home.each do |point|
        sum_point_home = sum_point_home + point
    end 
    all_points_away = game_hash[:away][:players].collect do |player|
        player[:points]
        end
    sum_point_away = 0
    all_points_away.each do |point|
        sum_point_away = sum_point_away + point
    end 
    
    if sum_point_home > sum_point_away
        "Brooklyn Nets"
    else
        "Charlotte Hornets"
    end
end

def player_with_longest_name
    all_names = all_players(game_hash).keys
    longest = all_names.collect do |name|
        name.length
    end.max
    all_names.each do |name|
        if name.length == longest
            return name
        end
    end
end

#Super Bonus:

def long_name_steals_a_ton
    most_steals = all_players(game_hash).collect do |name, stats|
        stats[:steals]
    end.max
    all_players(game_hash).each do |name, stats|
        if stats[:steals] == most_steals
            if stats[:player_name] == player_with_longest_name
                return true
            end
        end
    end
end


