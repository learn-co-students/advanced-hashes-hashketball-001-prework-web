require 'pry'

def game_hash
  game_hash = {
    :home => {
      team_name: "Brooklyn Nets", 
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" =>
        {number: 0, shoe: 16, num_points_scored: 22, rebounds: 12, assists: 12, steals: 3, 
        blocks: 1, slam_dunks: 1},
        "Reggie Evans" =>
        {number: 30, shoe: 14, num_points_scored: 12, rebounds: 12, assists: 12, steals: 12, 
        blocks: 12, slam_dunks: 7},
        "Brook Lopez" =>
        {number: 11, shoe: 17, num_points_scored: 17, rebounds: 19, assists: 10, steals: 3, 
        blocks: 1, slam_dunks: 15},
        "Mason Plumlee" =>
        {number: 1, shoe: 19, num_points_scored: 26, rebounds: 12, assists: 6, steals: 3, 
        blocks: 8, slam_dunks: 5},
        "Jason Terry" =>
        {number: 31, shoe: 15, num_points_scored: 19, rebounds: 2, assists: 2, steals: 4, 
        blocks: 11, slam_dunks: 1}
    }},
    
    :away => {
      team_name: "Charlotte Hornets", 
      colors: ["Turquoise", "Purple"], 
      players: {
        "Jeff Adrien" =>
        {number: 4, shoe: 18, num_points_scored: 10, rebounds: 1, assists: 1, steals: 2, 
        blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" =>
        {number: 0, shoe: 16, num_points_scored: 12, rebounds: 4, assists: 7, steals: 7, 
        blocks: 15, slam_dunks: 10},
        "DeSagna Diop" =>
        {number: 2, shoe: 14, num_points_scored: 24, rebounds: 12, assists: 12, steals: 4, 
        blocks: 5, slam_dunks: 5},
        "Ben Gordon" =>
        {number: 8, shoe: 15, num_points_scored: 33, rebounds: 3, assists: 2, steals: 1, 
        blocks: 1, slam_dunks: 0},  
        "Brendan Haywood" =>
        {number: 33, shoe: 15, num_points_scored: 6, rebounds: 12, assists: 12, steals: 22, 
        blocks: 5, slam_dunks: 12}
    }
  }
}
end

def num_points_scored(player_name)
  game_hash.each  {|location, team_data|
    team_data.each {|team_data, values|
      if team_data == :players
      values.each{|player, player_stats|
          if player == player_name
        player_stats.collect {|attribute, points|
          if attribute == :num_points_scored
            return points
          end
        }
        end
      }
    end
  }
  }
end

def shoe_size(player_name)
  game_hash.each  {|location, team_data|
    team_data.each {|team_data, values|
      if team_data == :players
      values.each{|player, player_stats|
          if player == player_name
        player_stats.each {|attribute, points|
          if attribute == :shoe
            return points
          end
        }
        end
      }
    end
  }
  }
end

def team_colors(team)
  game_hash.each {|location, team_data|
    if team_data[:team_name] == team
    team_data.each{|team_data, values|
      if team_data == :colors
        return values
      end
    }
  end
  }
end

def team_names
array = []
  game_hash.each{|location, team_data|
    team_data.collect{|team_data, value| 
      if team_data == :team_name
        array << value
      end
    }
  }
array
end

def player_numbers(team)
  points_array = []
  game_hash.each{|location, team_data| 
    if team_data[:team_name] == team
      team_data.each{|team_data, values|
        if team_data == :players
          values.each{|player, player_stats|
             player_stats.each{|attribute, points|
              if attribute == :number
                points_array << points
              end
            }
          }
        end
      }
    end
  }
points_array
end

def player_stats(player_name)
  game_hash.each{|location, team_data|
    team_data.each{|team_data, values|
      if team_data == :players
        values.each{|player, player_stats|
          if player_name == player
            player_stats[:points] = player_stats.delete(:num_points_scored)
            return player_stats
          end
        }
      end
    }
  }
end

def big_shoe_rebounds
  largest_shoe_size = 0
  largest_shoe_player_rebounds = 0

  game_hash.each{|location, team_data|
    team_data.each{|team_data, values|
      if team_data == :players
        values.each{|player, player_stats| 
          player_stats.each{|attribute, points|
            if attribute == :shoe
              if points > largest_shoe_size
                largest_shoe_size = points
                largest_shoe_player_rebounds = game_hash[location][team_data][player][:rebounds]
              end
            end
          }
        }
      end
    }
  }
  largest_shoe_player_rebounds
end

