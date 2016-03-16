require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7

      },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15

      },
      "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5

      },
      "Jason Terry" => {
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
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10

        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
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

def num_points_scored(name)
  #returns points scored for player given name
  game_hash.each do |location, team_data|
    team_data.each do |properties, info|
      if properties == :players
        info.each do |player_name, stats|
          if player_name == name
            stats.each do |stat, data|
              if stat == :points
                return data
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(name)
  #returns shoe size for a player given name
  game_hash.each do |location, team_data|
    team_data.each do |properties, info|
      if properties == :players
        info.each do |player_name, stats|
          if player_name == name
            stats.each do |stat, data|
              if stat == :shoe
                return data
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  #returns colors of a team given team name
  game_hash.each do |location, team_data|
    if team_data.values.include?(team_name)
      team_data.each do |property, info|
        if property == :colors
          return info
        end
      end
    end
  end
end

def team_names
  #returns the teams in the game as array
  game_hash.collect do |location, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  #returns player numbers as array given team name
  numbers = []
  game_hash.each do |location, team_data|
    if team_data.values.include?(team_name)
      team_data.each do |property, info|
        if property == :players
          info.each do |player_name, stats|
            stats.each do |stat, data|
              if stat == :number
                numbers << data
              end
            end
          end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  #returns stats hash
  #does not include player's name
 game_hash.each do |location, team_data|
    team_data.each do |properties, info|
      if properties == :players
        info.each do |player_name, stats|
          if player_name == name
            return stats
          end
        end
      end
    end
  end
end


#big_shoe_rebounds seemed to make more sense as three smaller methods?
#given solution doesn't work for my array
#this code is too convoluted but attempts to simplify don't work! >.<
def largest_shoe_size
 shoe_sizes = []
 game_hash.each do |location, team_data|
    team_data.each do |properties, info|
      if properties == :players
        info.each do |player_name, stats|
          stats.each do |stat, data|
            if stat == :shoe
              shoe_sizes << data
            end
          end
        end
      end
    end
  end
largest = shoe_sizes.max
end

def big_feet_name
  game_hash.each do |location, team_data|
    team_data.each do |properties, info|
      if properties == :players
        info.each do |player_name, stats|
          stats.each do |stat, data|
            if stat == :shoe && data == largest_shoe_size
              return player_name
            end
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  game_hash.each do |location, team_data|
    team_data.each do |properties, info|
      if properties == :players
        info.each do |player_name, stats|
          if player_name == big_feet_name
            stats.each do |stat, data|
              if stat == :rebounds
                return data
              end
            end
          end
        end
      end
    end
  end
end


