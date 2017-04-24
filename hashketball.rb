def game_hash
  basket_ball_hash = {
  :home => {
            :team_name => "Brooklyn Nets", 
            :colors => ["Black", "White"], 
            :players => {
                          "Alan Anderson" => {
                                        :player_name => "Alan Anderson", :number => 0, :shoe => 16, :num_points_scored => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1
                                        },
                          "Reggie Evans" => {
                                        :player_name => "Reggie Evans", :number => 30, :shoe => 14, :num_points_scored => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7
                                        },
                          "Brook Lopez" => {
                                        :player_name => "Brook Lopez", :number => 11, :shoe => 17, :num_points_scored => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15
                                        },
                          "Mason Plumlee" => {
                                        :player_name => "Mason Plumlee", :number => 1, :shoe => 19, :num_points_scored => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5
                                            },
                          "Jason Terry" => {
                                        :player_name => "Jason Terry", :number => 31, :shoe => 15, :num_points_scored => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1
                                        }                   
                        }
          },
  :away => {
            :team_name => "Charlotte Hornets", 
            :colors => ["Turquoise", "Purple"], 
            :players => {
                          "Jeff Adrien" => {
                                        :player_name => "Jeff Adrien", :number => 4, :shoe => 18, :num_points_scored => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2
                                        },
                          "Bismak Biyombo" => {
                                        :player_name => "Bismak Biyombo", :number => 0, :shoe => 16, :num_points_scored => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10
                                        },
                          "DeSagna Diop" => {
                                        :player_name => "DeSagna Diop", :number => 2, :shoe => 14, :num_points_scored => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5
                                        },
                          "Ben Gordon" => {
                                        :player_name => "Ben Gordon", :number => 8, :shoe => 15, :num_points_scored => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0
                                            },
                          "Brendan Haywood" => {
                                        :player_name => "Brendan Haywood", :number => 33, :shoe => 15, :num_points_scored => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12
                                        }
                        }
          }
}
end

def num_points_scored(string)
  basket_ball_hash = game_hash
  basket_ball_hash.each do |home_away, tn_c_players|
    # puts "home_away #{home_away}: tn_c_players #{tn_c_players}"
    tn_c_players.each do |players_tn_c, player_string|
      # puts "players_tn_c #{players_tn_c}"
      if player_string.is_a?(Hash)
        player_string.each do |players, stats_hash|
          # puts "players are #{players}: stats_hash is #{stats_hash}"
          if string == players
            # puts "home_away is #{home_away}: players_tn_c is #{players_tn_c}: players are #{players}: num_points_scored is #{:num_points_scored}"
            # puts "#{game_hash[home_away][players_tn_c][players][:num_points_scored]}"
            return game_hash[home_away][players_tn_c][players][:num_points_scored]
          end
        end
      end
    end
  end
end


def shoe_size(string)
  basket_ball_hash = game_hash
  basket_ball_hash.each do |home_away, tn_c_players|
    # puts "home_away #{home_away}: tn_c_players #{tn_c_players}"
    tn_c_players.each do |players_tn_c, player_string|
      # puts "players_tn_c #{players_tn_c}"
      if player_string.is_a?(Hash)
        player_string.each do |players, stats_hash|
          # puts "players are #{players}: stats_hash is #{stats_hash}"
          if string == players
            # puts "home_away is #{home_away}: players_tn_c is #{players_tn_c}: players are #{players}: num_points_scored is #{:num_points_scored}"
            # puts "#{game_hash[home_away][players_tn_c][players][:shoe]}"
            return game_hash[home_away][players_tn_c][players][:shoe]
          end
        end
      end
    end
  end
end


def team_colors(string)
  basket_ball_hash = game_hash
  basket_ball_hash.each do |home_away, tn_c_players|
    tn_c_players.each do |players_tn_c, player_string|
      if player_string == string
        # puts "players_tn_c #{players_tn_c}: player_string #{player_string}: string #{string}"
        # puts "#{game_hash[home_away][:colors]}"
        return game_hash[home_away][:colors]
      end
    end
  end
end

def team_names
  basket_ball_hash = game_hash
  team_name_array = []
  team_name_array << game_hash[:home][:team_name]
  team_name_array << game_hash[:away][:team_name]
  return team_name_array
end

def player_numbers(string)
  basket_ball_hash = game_hash
  team_numbers_array = []
    basket_ball_hash.each do |home_away, tn_c_players|
    tn_c_players.each do |players_tn_c, player_string|
      if player_string == string
        game_hash[home_away][:players].each do |name, stats|
          team_numbers_array << game_hash[home_away][:players][name][:number]
        end
      end
    end
  end
  return team_numbers_array
end

def player_stats(string)
  basket_ball_hash = game_hash
  stat_line_hash = {}
  basket_ball_hash.each do |home_away, tn_c_players|
    tn_c_players.each do |players_tn_c, player_string|
      if player_string.is_a?(Hash)
        player_string.each do |players, stats_hash|
          if string == players
            # puts "players is #{game_hash[home_away][players_tn_c][players].delete!(:player_name)}"
            # game_hash[home_away][players_tn_c][players].delete(:player_name)
            stats_hash.each do |attribute, number|
              if attribute == :num_points_scored
                stat_line_hash[:points] = number
              elsif attribute != :player_name
                stat_line_hash[attribute] = number
                # puts "stat_line_hash is #{stat_line_hash}"
              end
              # game_hash[home_away][players_tn_c][players]
            end
          end
        end
      end
    end
  end  
  return stat_line_hash
end

def big_shoe_rebounds
  basket_ball_hash = game_hash
  # basket_ball_hash.sort_by do |home_away, tn_c_players|
  #   tn_c_players[:players][:shoe]
  # end
  shoes = []
  who_is_this = 0
  basket_ball_hash.each do |home_away, tn_c_players|
    tn_c_players.each do |players_tn_c, player_string|
      if player_string.is_a?(Hash)
        player_string.each do |players, stats_hash|
          shoes << stats_hash[:shoe]          
          # puts "#{stats_hash[:shoe]}"
          # puts "#{players}"
          # who_is_this = shoes.max
          # our_guy = game_hash[home_away][:players][name][who_is_this]
          # puts "#{our_guy}"
        end
        # puts "shoe max is #{who_is_this}"
        # puts "#{basket_ball_hash[home_away][player_string][:shoe]}"
        
        
        # return basket_ball_hash[home_away][player_string][:rebounds]
        
      end
    end
  end
  who_is_this = shoes.max
  puts "who_is_this #{who_is_this}"
  basket_ball_hash.each do |home_away, tn_c_players|
    tn_c_players.each do |players_tn_c, player_string|
      if player_string.is_a?(Hash)
        player_string.each do |players, stats_hash|
          stats_hash.each do |stats, numbers|
            puts "stats_hash shoes #{numbers}"
            if stats_hash[:shoe] == who_is_this
              # puts "stats_hash rebounds #{players}"
              return stats_hash[:rebounds]
            end
          end
        end
      end
    end
  end
end
