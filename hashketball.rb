require 'pry'

def game_hash
{
  :home => {:team_name => "Brooklyn Nets",
            :colors => ["Black", "White"], 
            :players => [
              {:player_name => "Alan Anderson", 
               :number => 0,
               :shoe => 16, 
               :points => 22, 
               :rebounds => 12, 
               :assists => 12, 
               :steals => 3, 
               :blocks => 1, 
               :slam_dunks => 1
               },
               {:player_name => "Reggie Evans", 
               :number => 30,
               :shoe => 14, 
               :points => 12, 
               :rebounds => 12, 
               :assists => 12, 
               :steals => 12, 
               :blocks => 12, 
               :slam_dunks => 7 
               }, 
               {:player_name => "Brook Lopez", 
               :number => 11,
               :shoe => 17, 
               :points => 17, 
               :rebounds => 19, 
               :assists => 10, 
               :steals => 3, 
               :blocks => 1, 
               :slam_dunks => 15
                }, 
                {:player_name => "Mason Plumlee", 
               :number => 1,
               :shoe => 19, 
               :points => 26, 
               :rebounds => 12, 
               :assists => 6, 
               :steals => 3, 
               :blocks => 8, 
               :slam_dunks => 5
                },
                {:player_name => "Jason Terry", 
               :number => 31,
               :shoe => 15, 
               :points => 19, 
               :rebounds => 2, 
               :assists => 2, 
               :steals => 4, 
               :blocks => 11, 
               :slam_dunks => 1
                }
              ]
            },

  :away => {:team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"], 
            :players => [
              {:player_name => "Jeff Adrien", 
               :number => 4,
               :shoe => 18, 
               :points => 10, 
               :rebounds => 1, 
               :assists => 1, 
               :steals => 2, 
               :blocks => 7, 
               :slam_dunks => 2
               },
               {:player_name => "Bismak Biyombo", 
               :number => 0,
               :shoe => 16, 
               :points => 12, 
               :rebounds => 4, 
               :assists => 7, 
               :steals => 7, 
               :blocks => 15, 
               :slam_dunks => 10 
               }, 
               {:player_name => "DeSagna Diop", 
               :number => 2,
               :shoe => 14, 
               :points => 24, 
               :rebounds => 12, 
               :assists => 12, 
               :steals => 4, 
               :blocks => 5, 
               :slam_dunks => 5
                }, 
                {:player_name => "Ben Gordon", 
               :number => 8,
               :shoe => 15, 
               :points => 33, 
               :rebounds => 3, 
               :assists => 2, 
               :steals => 1, 
               :blocks => 1, 
               :slam_dunks => 0
                },
                {:player_name => "Brendan Haywood", 
               :number => 33,
               :shoe => 15, 
               :points => 6, 
               :rebounds => 12, 
               :assists => 12, 
               :steals => 22, 
               :blocks => 5, 
               :slam_dunks => 12
                }
              ]
            }
}

end


def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |stats|
          if stats[:player_name] == name
             return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |stats|
          if stats[:player_name] == name
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      return game_hash[location][:colors]
    end
  end
end
     
def team_names
  game_hash.collect do |location, team_data|
     game_hash[location][:team_name]
      end
    end

def player_numbers(team_name)
  team_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |stats|
            team_numbers << stats[:number]
          end
        end
      end
    end
  end
  team_numbers
end

def player_stats(name)
  player_stats = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
          data.each do |stats|
            if stats[:player_name] == name
              stats.delete(:player_name)
              return stats
            end
          end
        end
      end
    end
  end

def big_shoe_rebounds
  biggest_value = 0
  rebounds = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
          data.each do |stats|
            if stats[:shoe] > biggest_value
              biggest_value = stats[:shoe]
              rebounds = stats[:rebounds]
              end
            end
          end
        end
      end
      rebounds
    end

#BONUS

def most_points_scored
    most_points = 0
    most_player = nil

    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |stats|
            if stats[:points] > most_points
              most_points = stats[:points]
              most_player = stats[:player_name]
            end
          end
        end
      end
    end
    most_player
  end

#def winning_team - will do later.............maybe :)

def player_with_longest_name 
  longest_name = 0
  longest_player = nil

  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |stats|
            if stats[:player_name].length > longest_name
              longest_name = stats[:player_name].length
              longest_player = stats[:player_name]
            end
          end
        end
      end
    end
    longest_player
  end

#Super_Bonus

def long_name_steals_a_ton
  most_steals = 0
  player_most = nil
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |stats|
            if stats[:steals] > most_steals
              most_steals = stats[:steals]
              player_most = stats[:player_name]
            end
           end
           end
         end
       end
       player_with_longest_name == player_most
     end


