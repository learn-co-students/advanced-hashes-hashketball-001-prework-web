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

#def player_stats(that_guy)
#    player_stats = Hash.new
#    game_hash.each do |location, team|
#        team.each do |attribute, data|
#            if attribute == :players
#                data.each do |player|
#                    if player[:player_name] == that_guy
#                       player.each do |player_att, player_data|
#                            if !(player_att == :player_name)
#                                player_stats[player_att] = player_data
#                            end
#                       end 
#                    end
#                end
#            end
#        end
#    end
#    player_stats
#end










