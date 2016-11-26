# Write your code here!
require 'pry'

def game_hash
  game_hash = 
  {
    :home => 
    {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => 
      {
        "Alan Anderson" => 
        {
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
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => 
    {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => 
      {
        "Jeff Adrien" => 
        {
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
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash.each do |place, team|
    team.each do |attributes, details|
      if attributes == :players
        details.each do |name, stats|
          if name == player
            stats.each do |stat, num|
              if stat == :points
                return num
              else 
                nil
              end
            end
          else
            nil
          end
        end
      else
        nil
      end
    end 
  end
end

def shoe_size(player)
  game_hash.each do |place, team|
    team.each do |attributes, details|
      if attributes == :players
        details.each do |name, stats|
          if name == player
            stats.each do |stat, num|
              if stat == :shoe
                return num
              else 
                nil
              end
            end
          else
            nil
          end
        end
      else
        nil
      end
    end 
  end
end

def team_colors(team)
  game_hash.each do |place, details|
    if game_hash[place][:team_name] == team
      return game_hash[place][:colors]
    else
      nil
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team|
    teams.push(team[:team_name])
  end
  teams
end

def player_numbers(team)
  numbers = []
  game_hash.each do |place, details|
    if game_hash[place][:team_name] == team
      details.each do |attributes, values|
        if attributes == :players
          values.each do |name, stats|
            numbers.push(game_hash[place][:players][name][:number])
          end
        else
          nil
        end
      end
    else
      nil
    end
  end
  numbers
end

def player_stats(player)
  game_hash.each do |place, details|
    details.each do |attributes, values|
      if attributes == :players
        values.each do |name, stats|
          if name == player
            return game_hash[place][:players][name]
          else 
            nil
          end
        end
      else
        nil
      end
    end
  end
end

def players
  player_stats = []
  game_hash.each do |place, details|
    details.each do |attributes, values|
      if attributes == :players
        player_stats.push(values)
      else
        nil
      end
    end
  end
  player_stats
end

def max_shoes(game_hash)
  shoes = []
  game_hash.each do |place, details|
    details.each do |attributes, values|
      if attributes == :players
        values.each do |name, stats|
          shoes.push(game_hash[place][:players][name][:shoe])
        end
      else
        nil
      end
    end
  end
  shoes.max
end

def biggest_shoe(game_hash)
  game_hash.each do |place, details|
    details.each do |attributes, values|
      if attributes == :players
        values.each do |name, stats|
          if game_hash[place][:players][name][:shoe] == max_shoes(game_hash)
            return name
          else
            nil
          end
        end
      else
        nil
      end
    end
  end
end

def big_shoe_rebounds
  game_hash.each do |place, details|
    details.each do |attributes, values|
      if attributes == :players
        values.each do |name, stats|
          if name == biggest_shoe(game_hash)
            return game_hash[place][:players][name][:rebounds]
          else
            nil
          end
        end
      else
        nil
      end
    end
  end
end











