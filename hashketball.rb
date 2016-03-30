require 'pry'

# Write your code here!
def game_hash
  game_hash = 
  { # open game_hash
    :home =>
      { # open home values
        :team_name => "Brooklyn Nets", :colors => ["black", "white"], :players =>
        { #open players hash
      "Alan Anderson" =>
        {
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },
      "Reggie Evans" =>
        {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },
      "Brook Lopez" =>
        {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
      "Mason Plumlee" =>
        {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
      "Jason Terry" =>
        {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
        } # close players hash
         }, # close home values
    :away =>
      { # open away values
        :team_name => "Charlotte Hornets", :colors => ["turquoise", "purple"], :players =>
        { # open players hash
      "Jeff Adrien" =>
        {
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
      "Bismak Biyombo" =>
        {
        :player_name => "Bismak Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
        },
      "DeSagna Diop" =>
        {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
      "Ben Gordon" =>
        {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
      "Brendan Haywood" =>
        {
        :player_name => "Brendan Haywood",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
        }
        } #close players bracket
         } # close away
  } # close game_hash
end

def num_points_scored(player)
  player_points = 0
  game_hash.each_value do |team_data|
    team_data.each do |team_key, team_value|
      if team_key == :players
        team_value.each do |name, stats|
          if name == player 
            stats.each do |stat_key, stat_value|
              if stat_key == :points
                player_points = stat_value
              end
            end
          end
        end
      end 
    end
  end
  player_points
end

def shoe_size(player)
  size = 0
  game_hash.each_value do |team_data|
    team_data.each do |team_key, team_value|
      if team_key == :players
        team_value.each do |name, stats|
          if name == player 
            stats.each do |stat_key, stat_value|
              if stat_key == :shoe
                size = stat_value
              end
            end
          end
        end
      end 
    end
  end
  size
end

def team_colors(team)
  colors = []
  game_hash.each do |home_or_away, team_data|
    team_data.each do |team_key, team_value|
      if team_value == team
        game_hash[home_or_away][:colors].each do |color|
          colors << color.capitalize
        end

      end 
    end
  end
  colors
end

def team_names
  team_names_array = []
  game_hash.each_value do |team_data|
    team_data.each do |team_key, team_value|
      if team_key == :team_name
        team_names_array << team_value
      end 
    end
  end
  team_names_array
end

def player_numbers(team)
  jersey_array = []
  game_hash.each do |home_or_away, team_data|
    team_data.each do |team_key, team_value|
      if team_value == team
        game_hash[home_or_away][:players].each do |name, stats|
          stats.each do |stat_key, stat_value| 
            if stat_key == :number
              jersey_array << stat_value
            end
          end          
        end
      end
    end
  end
  jersey_array
end

def player_stats(player)
  stats_hash = {}
  game_hash.each_value do |team_data|
    team_data.each do |team_key, team_value|
      if team_key == :players
        team_value.each do |name, stats|
          if name == player 
            stats.each do |stat_key, stat_value|
              if stat_key != :player_name
                stats_hash[stat_key] = stat_value
              end
            end
          end
        end
      end 
    end
  end
  stats_hash
end

def big_shoe_rebounds
# first create shoe hash and sort by size in reverse
  shoe_hash = {}
  game_hash.each do |home_or_away, team_data|
    team_data.each do |team_key, team_value|
      if team_key == :players
        game_hash[home_or_away][:players].each do |name, stats|
          stats.each do |stat_key, stat_value| 
            if stat_key == :shoe
              shoe_hash[name] = stat_value
            end
          end          
        end
      end
    end
  end
  sorted_shoe_hash = shoe_hash.sort_by do |player, size|
    size
  end
  target_player = sorted_shoe_hash.reverse[0][0]

#next find rebounds for target_player
  rebound_number = 0
  game_hash.each_value do |team_data|
    team_data.each do |team_key, team_value|
      if team_key == :players
        team_value.each do |name, stats|
          if name == target_player 
            stats.each do |stat_key, stat_value|
              if stat_key == :rebounds
                rebound_number = stat_value
              end
            end
          end
        end
      end 
    end
  end
  rebound_number
end
