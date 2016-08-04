# Write your code here!

require 'pry'

def game_hash
  {
  :home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => {
    "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
    "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
    "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
    "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
    "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
    }
  },
  :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => {
    "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
    "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
    "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
    "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
    "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
    }
  }  
  }
end  

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    #binding.pry
    #location = home or away
    #team_data = the entire hash of data after that p
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        #binding.pry
        #attribute = :team_name, :colors, :players
        #data = Brooklyn Nets, Black, White, hash of players and that info
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        #data.each do |data_item|
            #binding.pry
      #end
    end
  end
end

good_practices

def num_points_scored(player_name)
#return number of points scored by that player
  game_hash.each do |location, team_data|
    #binding.pry
    #this gives home/away, then the hash info after that 
    team_data.each do |attribute, data|
      #binding.pry
      if attribute == :players
        data.each do |name, info|
          if name == player_name
            return game_hash[location][:players][player_name][:points]
          end  
        end  
      end  
    end    
  end     
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, info|
          if name == player_name
            return game_hash[location][:players][player_name][:shoe]
          end  
        end  
      end  
    end    
  end     
end


def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        return game_hash[location][:colors]
      end  
    end  
  end      
end

def team_names 
  team_names = []
  game_hash.each do |location, team_data|
    team_names << game_hash[location][:team_name]
  end
  team_names  
end

def player_numbers(team_name) 
  numbers = []
   game_hash.each do |place, team|
     if team[:team_name] == team_name
       team.each do |attribute, data|
         if attribute == :players
           data.each do |name, data|
             numbers << data[:number]
           end
         end
       end
     end
   end
   numbers     
end


def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, info|
          if name == player_name
            return game_hash[location][:players][player_name]
          end
        end  
      end
    end
  end      
end

def big_shoe_rebounds
  #return number of rebounds for player with biggest shoe size
  shoe_size = 0
  biggest_shoe_owner = ""
  rebound_number = 0
  shoes_size = []
    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |name, info|
            shoes_size << game_hash[location][:players][name][:shoe] 
            shoe_size == shoes_size.max
            biggest_shoe_owner = name
            rebound_number = info[:rebounds]
          end
        
        end
      end
    end          
    rebound_number
end

#the below method did not pass!
def most_points_scored
  points_scored = 0
  player = ""
  points_scored_array = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, info|  
          points_scored_array << game_hash[location][:players][name][:points]
          points_scored = points_scored_array.max
          player = name
          # the above line is where things go wonky. Not sure how to fix. :(
        
    end
  end     
  player
end
#the most_points_scored array didn't work






























