require 'pry'

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, 
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Purple", "Turquoise"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2}, 
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      }
    }
  }
end

def num_points_scored(b_baller) #returns player's number of points
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attribute_data|
      if attribute == :players
        attribute_data.each do |player_name, player_stats|
          if player_name == b_baller
            player_stats.each do |stat, value|
              if stat == :points
                return points = value
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(b_baller) # returns player's shoe size
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attribute_data|
      if attribute == :players
        attribute_data.each do |player_name, player_stats|
          if player_name == b_baller
            player_stats.each do |stat, value|
              if stat == :shoe
                return value
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name) # returns array of team colors
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attribute_value|
      if team_data[:team_name] == team_name
        return game_hash[location][:colors]
      end
    end
  end
end


def team_names # returns array of team names
  teams_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attribute_value|
      if attribute == :team_name
        teams_array << attribute_value
      end
    end
  end
  teams_array
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, attribute_data|
        if attribute == :players
          attribute_data.each do |player_name, player_stats|
            player_stats.each do |statistic, value|
              if statistic == :number
                numbers << value
              end
            end
          end
        end
      end
    end
  end
  numbers
end

def player_stats(b_baller) # returns has of player's stats
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attribute_data|
      if attribute == :players
        attribute_data.each do |player_name, player_stats|
          if player_name == b_baller
            return player_stats
          end
        end
      end
    end
  end
end

# return the number of rebounds of the player with the largest shoe
# find the biggest shoe
def big_shoe_rebounds
  biggest_shoe = 0
  rebound_count = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, attribute_value|
      if attribute == :players
        attribute_value.each do |player_name, player_data|
          if player_data[:shoe] > biggest_shoe
            biggest_shoe = player_data[:shoe]
            rebound_count = player_data[:rebounds]
          end
        end
      end
    end
  end

  rebound_count
end
big_shoe_rebounds

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, 
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Purple", "Turquoise"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2}, 
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      }
    }
  }
end

