def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"] , 
      :players => 
        {"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1 },
        "Reggie Evans" => {:number => 30, :shoe =>14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7 },
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15 },
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5 },
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1 }
      }
    },

    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => 
        {"Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10 },
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals =>4, :blocks => 5, :slam_dunks => 5 },
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0 },
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12 }
      }
    }
  }
end




def player_with_longest_name
  length = 0
  player_with_longest_name = ""
  game_hash.values.each do |team|
    team[:players].keys.each do |name|
      if name.length > length
        length = name.length
        player_with_longest_name = name
      end
    end
  end
  player_with_longest_name      
end  

def long_name_steals_a_ton?#longest name the one with the most steals?
  most_steals = 0
  stealer = ""
  game_hash.values.each do |team|
    team[:players].each do |name, stat|
      if stat[:steals] > most_steals
        most_steals  = stat[:steals]
        stealer = name
      end
    end
  end
  player_with_longest_name == stealer
end 

 

def winning_team
  #which team has the most points
  most_points = 0
  team_name = nil
  game_hash.values.each do |team|
    team_points = 0
    team[:players].values.each do |stats|
      team_points += stats[:points]
    end
    if team_points > most_points
      most_points = team_points
      team_name = team[:team_name]
    end
  end
  team_name
end        


 

def most_points_scored
  most_points = 0
  player_name = ""
  #which players has most points?
  game_hash.each do |location, info|
    info.each do |info, data|
      if info == :players
        data.each do |name, stats|
          stats.each do |stat, num|
            if stat == :points
              if num > most_points
                most_points = num
                player_name = name
              end 
            end
          end
        end
      end
    end
  end   
  return player_name          
end


def big_shoe_rebounds
  #find player with largest shoe size, return his number of rebounds
  bigfoot_player = ""
  biggest_shoe_size = 0
  game_hash.each do |location, info|
    info.each do |info, data|
      if info == :players
        data.each do |name, stats|
          stats.each do |stat, num|
            if stat == :shoe
              if num > biggest_shoe_size
                biggest_shoe_size = num
                bigfoot_player = name
              end
            end
          end
        
        end
      end
    end
  return game_hash[location][:players][bigfoot_player][:rebounds]
  end      
  
end  


def player_stats(player_name)
  #return hash of that player's stats
  game_hash.each do |location, info|
    info.each do |info, data|
      if info == :players
        data.each do |name, hash|
          if name == player_name
            return game_hash[location][:players][name]
          end
        end
      end
    end
  end
end            



def player_numbers(team_name)
  #return array of player numbers
  player_numbers = []
  game_hash.collect do |location, info|
    info.collect do |info, data|
      if data == team_name
        game_hash[location][:players].collect do |name, attributes|
          player_numbers << game_hash[location][:players][name][:number]
        end
      end
    end
  end
  player_numbers          
end  

def team_names
  #return array of team names
  array =[]
  game_hash.collect do |location, info|
    info.collect do |info, data|
      if info == :team_name
        array << data
      end
    end
  end
  array
end        


def team_colors(team_name)
  #return array of team colors
  game_hash.each do |location, info|
    info.each do |info, data|
      if data == team_name
        return game_hash[location][:colors]
      end
    end
  end      
end  

def shoe_size(name)
  #returns shoe size for player
  game_hash.each do |location, info|
    info.each do |info, data|
      if info == :players
        data.each do |player_name, stats|
          if player_name == name
            return game_hash[location][:players][name][:shoe]
          end
        end
      end
    end
  end          
end

def num_points_scored(name)
  #return num points for player 
  game_hash.each do |location, info|
    info.each do |info, data|
      if info == :players
        data.each do |player_name, info|
          if name == player_name
            return game_hash[location][:players][name][:points]
          end  
        end
      end
    end
  end
end          




















