require 'pry'
# Write your code here!
def game_hash
  {
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
      :colors => ["Turquoise", "Purple"],
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


def num_points_scored(players_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if(name == players_name)
        return stats[:points]
      end
    end
  end

end


def shoe_size(players_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if(name == players_name)
        return stats[:shoe]
      end
    end
  end  
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if(team_data[:team_name] == team_name)
      return team_data[:colors]
    end
  end
end

def team_names
  temp_array = []
  game_hash.each do |location, team_data|
    temp_array << team_data[:team_name]
  end
  temp_array
end


def player_numbers(team_name)
  temp_array = []
  game_hash.each do |location, team_data|
    if(team_data[:team_name] == team_name)
      team_data[:players].each do |name, stats|
        temp_array << stats[:number]
      end
    end
  end
  temp_array
end

def player_stats(players_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if(name == players_name)
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  l_shoe = 0
  num_of_rebounds = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if(stats[:shoe] > l_shoe)
        l_shoe = stats[:shoe]
        num_of_rebounds = stats[:rebounds]
      end
    end
  end
  num_of_rebounds
end

def most_points_scored
  most_points = 0
  player = " "

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if(stats[:points] > most_points)
        most_points = stats[:points]
        player = name
      end
    end
  end
  player
end

def winning_team
  sum = 0
  sum_array = []

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      sum += stats[:points]
    end
    sum_array << sum
    sum = 0
  end

  if(sum_array[0] > sum_array[1])
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  player = " "
  player_length = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stat|
      if(name.length > player_length)
        player_length = name.length
        player = name
      end
    end
  end
  player
end

def long_name_steals_a_ton?
  l_name = player_with_longest_name
  l_name_steals = 0
  num_of_steals = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stat|
      if(name == l_name)
        l_name_steals = stat[:steals]
      else
        if(stat[:steals] > num_of_steals)
          num_of_steals = stat[:steals]
        end
      end
    end
  end
  l_name_steals > num_of_steals
end

























