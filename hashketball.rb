# Write your code here!
def game_hash
{ :home => 
  {
  :team_name => "Brooklyn Nets", 
  :colors => ["Black", "White"], 
  :players => {"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
               "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
             "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
             "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
             "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}}
  # :players => {
  #   "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
  #             "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7}, 
  #             "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
  #             "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5}, 
  #             "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1} 
  },
  
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {"Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
                "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
                "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
                "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
                "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}}
  }
}
end

def num_points_scored(players_name)
  game_hash.each do |team, category|

    category.each do |key, value| 
      if value.include?(players_name)
        value.each do |player, stats| 
          
          if player == players_name
            stats.each do |category, stat|
              
              if category == :points
                
                # puts stat
                return stat
              end
            end
          end
        end
      end
    end

  end
  
end

# num_points_scored("Reggie Evans")

def shoe_size(players_name)

  game_hash.each do |team, category|

    category.each do |key, value| 
      if value.include?(players_name)
        value.each do |player, stats| 
          
          if player == players_name
            stats.each do |category, stat|
              
              if category == :shoe
                
                # puts stat
                return stat
              end
            end
          end
        end
      end
    end

  end
  
end


def team_colors(t_name)
   game_hash.each do |team, category| #:home #away VALS: team_name, colors players, 
    category.each do |ctgry, value|
      if value == t_name
        category.each do |categ, val|
          if categ == :colors
            # puts val
            return val
          end
        end
      end
    end
  end
end


def team_names
 arr_of_team_names = []
  
 game_hash.each do |team, category| #:home #away VALS: team_name, colors players, 

    category.each do |ctgry, value|
  
      if ctgry == :team_name
        arr_of_team_names << value
      end
    end
  end
   
  arr_of_team_names
end

# Build a method, player_numbers, that takes in an argument of a team name and returns an array of the jersey number's for that team.
# Build a method, player_stats, that takes in an argument of a player's name and returns a hash of that player's stats.
def player_numbers(t_name)
  final_jersey_nums = []
  game_hash.each do |team, category|

    category.each do |ctgry, value|
    unless (value != t_name)
    category.each do |ctgry, value|
  
        if ctgry == :players
            value.each do |person, stuff|
         
                stuff.each do |num_cat, num_val|
               
                  if num_cat == :number
                    # puts num_val
                  
                    final_jersey_nums << num_val
                  end
              
              end
            end
          
        end
      end
    end
  end
  end
 
  final_jersey_nums
end

# player_numbers("Brooklyn Nets")

def player_stats(players_name)

  game_hash.each do |team, category|

    category.each do |ctgry, value|
    # unless (value != t_name)
    category.each do |ctgry, value|
  
        if ctgry == :players
            value.each do |person, stuff|
              if person == players_name
                # puts stuff
                return stuff
              end
            end
          
        end
      # end
    end
    end
  end
end


def big_shoe_rebounds
  biggest_shoe_size = 0
  biggest_foot_man = ""
   biggest_rebounds = 0
   game_hash.each do |team, category|

    category.each do |ctgry, value|

        if ctgry == :players
            value.each do |person, stuff|
              stuff.each do |stff, val|
              if stff == :shoe
                  if val > biggest_shoe_size
                 
                    biggest_shoe_size = val
                    biggest_foot_man = person
                    stuff.each do |stf, v|
                      if stf == :rebounds
                        biggest_rebounds = v
                      end
                    end
                    # biggest_rebounds = game_hash[team][ctgry][stuff][biggest_foot_man][:rebounds]
                  end

              end
                
             end
            end
    end
    end
  end
  biggest_foot_man
  biggest_shoe_size
  
  biggest_rebounds
  
end
