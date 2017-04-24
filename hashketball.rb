# Write your code here!

#Returns game_hash
def game_hash
  { 
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

#Returns number of points scored, given the player name
def num_points_scored(name)
  game_hash.each do |location, attributes|
    game_hash[location][:players].each do|pname, stats|
      if pname == name
        return game_hash[location][:players][pname][:points]
      end
    end
  end
end

#Returns shoe size, given the player name
def shoe_size(name)
  game_hash.each do |location, attributes|
    game_hash[location][:players].each do|pname, stats|
      if pname == name
        return game_hash[location][:players][pname][:shoe]
      end
    end
  end
end

#Returns array of team colors, given the team name
def team_colors(team)
  game_hash.each do |location, attribute|
    if game_hash[location][:team_name] == team
      return game_hash[location][:colors]
    end
  end
end 


#Returns array of team names in game_hash
def team_names
  game_hash.collect do |location, attribute|
    game_hash[location][:team_name]
  end
end 

#Returns array of team numbers given team name
def player_numbers(team)
  #iterate through home and away
  return_array = []
  game_hash.each do |location, attribute|
    if game_hash[location][:team_name] == team
      return_array = game_hash[location][:players].collect do |pname, stat|
        game_hash[location][:players][pname][:number]
      end
      return_array.sort!
    end
  end
  return_array
end 

#Returns hash of player's stats given player's name
def player_stats(name)
  game_hash.each do |location, attributes|
    game_hash[location][:players].each do|pname, stats|
      if pname == name
        return game_hash[location][:players][pname]
      end
    end
  end
end

#Returns the number of rebounds associated with the player that has the largest shoe size
def big_shoe_rebounds
  #Find player with biggest shoe
  find_number_rebounds(find_max_shoe)
end

#Returns the name of the player with the maximum shoe size
def find_max_shoe
  #Set max_shoe equal to negative infinity
  max_shoe = -1.0/0
  max_shoe_player = nil
  game_hash.each do |location, attributes|
    game_hash[location][:players].each do|pname, stats|
      if game_hash[location][:players][pname][:shoe] > max_shoe
        max_shoe = game_hash[location][:players][pname][:shoe]
        max_shoe_player = pname
      end
    end
  end
  max_shoe_player
end

#Returns number of rebounds, given the player name
def find_number_rebounds(name)
#Output that player's number of rebounds
  game_hash.each do |location, attributes|
    game_hash[location][:players].each do|pname, stats|
      if pname == name
        return game_hash[location][:players][pname][:rebounds]
      end
    end
  end
end

#BONUS QUESTIONS
#Returns the name of the player with most points
def most_points_scored
    #Set max_shoe equal to negative infinity
  max_points = -1.0/0
  max_points_player = nil
  game_hash.each do |location, attributes|
    game_hash[location][:players].each do|pname, stats|
      if game_hash[location][:players][pname][:points] > max_points
        max_points = game_hash[location][:players][pname][:points]
        max_points_player = pname
      end
    end
  end
  max_points_player
end
