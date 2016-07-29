require 'pry'
# Write your code here!
def game_hash
  game_hash = { :home => { :team_name => "Brooklyn Nets", 
                           :colors => ["Black", "White"], 
                           :players => { :alan_anderson => { :number => 0,
                                                             :shoe => 16,
                                                             :points => 22,
                                                             :rebounds => 12,
                                                             :assists => 12,
                                                             :steals => 3,
                                                             :blocks => 1,
                                                             :slam_dunks => 1 },
                                         :reggie_evans =>  { :number => 30,
                                                             :shoe => 14,
                                                             :points => 12,
                                                             :rebounds => 12,
                                                             :assists => 12,
                                                             :steals => 12,
                                                             :blocks => 12,
                                                             :slam_dunks => 7 },
                                         :brook_lopez =>   { :number => 11,
                                                             :shoe => 17,
                                                             :points => 17,
                                                             :rebounds => 19,
                                                             :assists => 10,
                                                             :steals => 3,
                                                             :blocks => 1,
                                                             :slam_dunks => 15 },
                                         :mason_plumlee => { :number => 1,
                                                             :shoe => 19,
                                                             :points => 26,
                                                             :rebounds => 12,
                                                             :assists => 6,
                                                             :steals => 3,
                                                             :blocks => 8,
                                                             :slam_dunks => 5 },
                                         :jason_terry =>   { :number => 31,
                                                             :shoe => 15,
                                                             :points => 19,
                                                             :rebounds => 2,
                                                             :assists => 2,
                                                             :steals => 4,
                                                             :blocks => 11,
                                                             :slam_dunks => 1 }
                                        }
                          }, 

                :away => { :team_name => "Charlotte Hornets", 
                           :colors => ["Turquoise", "Purple"], 
                           :players => { :jeff_adrien =>   { :number => 4,
                                                             :shoe => 18,
                                                             :points => 10,
                                                             :rebounds => 1,
                                                             :assists => 1,
                                                             :steals => 2,
                                                             :blocks => 7,
                                                             :slam_dunks => 2 },
                                        :bismak_biyombo => { :number => 0,
                                                             :shoe => 16,
                                                             :points => 12,
                                                             :rebounds => 4,
                                                             :assists => 7,
                                                             :steals => 7,
                                                             :blocks => 15,
                                                             :slam_dunks => 10 },
                                         :desagna_diop =>  { :number => 2,
                                                             :shoe => 14,
                                                             :points => 24,
                                                             :rebounds => 12,
                                                             :assists => 12,
                                                             :steals => 4,
                                                             :blocks => 5,
                                                             :slam_dunks => 5 },
                                         :ben_gordon => {    :number => 8,
                                                             :shoe => 15,
                                                             :points => 33,
                                                             :rebounds => 3,
                                                             :assists => 2,
                                                             :steals => 1,
                                                             :blocks => 1,
                                                             :slam_dunks => 0 },
                                      :brendan_haywood => {  :number => 33,
                                                             :shoe => 15,
                                                             :points => 6,
                                                             :rebounds => 12,
                                                             :assists => 12,
                                                             :steals => 22,
                                                             :blocks => 5,
                                                             :slam_dunks => 12 }
                                        }
                          } 
                }
    return game_hash
end

def num_points_scored(player)
  a = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Hash)
        data.each do |player_name, stats|
          if player_name.to_s.split("_").join(" ") == player.downcase 
            stats.each do |stat, numbers|
              if stat == :points 
                a = numbers
              end
            end
          end
        end
      end
    end
  end
  a
end

def shoe_size(player)
  a = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Hash)
        data.each do |player_name, stats|
          if player_name.to_s.split("_").join(" ") == player.downcase 
            stats.each do |stat, numbers|
              if stat == :shoe
                a = numbers
              end
            end
          end
        end
      end
    end
  end
  a
end

def team_colors(team)
  a = []
  game_hash.each do |location, team_data|
      team_data.each do |attributes, data|
         if data == team 
            team_data.each do |attributes, data|
              if attributes == :colors
                a << data
              end
            end
         end
      end
  end
  a.flatten
end

def team_names 
  a = []
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if attributes == :team_name
        a << data
      end
    end
  end
  a.flatten
end

def player_numbers(team)
  a = []
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if data == team
        team_data.each do |attributes, data|
          if data.is_a?(Hash)
            data.each do |player_name, stats|
              stats.each do |stat, numbers|
                if stat == :number
                  a << numbers
                end
              end
            end
          end
        end
      end
    end
  end
  a.flatten
end

def player_stats(player)
  a = {}
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if attributes == :players
        data.each do |player_name, stats|
          if player_name.to_s.split("_").join(" ") == player.downcase
            a = stats
          end
        end
      end
    end
  end
  a
end

def big_shoe_rebounds
  a = ""
  biggest_shoes = []
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if attributes == :players
        data.each do |player_name, stats|
          stats.each do |stat, numbers|
            if stat == :shoe
              biggest_shoes << numbers
              biggest = biggest_shoes.max
                if numbers == 19
                  stats.each do |stat, numbers|
                    if stat == :rebounds 
                      a = numbers
                    end
                  end
                end
            end
          end
        end
      end
    end
  end
  a
end



