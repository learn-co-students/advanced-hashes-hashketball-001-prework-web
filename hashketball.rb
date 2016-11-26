require 'pry'

 def game_hash
   {
     :away => { :team_name => "Charlotte Hornets",
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
             },
     :home => { :team_name => "Brooklyn Nets",
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
     }
   }
 end



def num_points_scored(input_name)
  game_hash.each do |location, team_data|  
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|            
            if data_item[:player_name] == input_name
              return data_item[:points]
          end
        end
      end
    end
  end
end

def shoe_size(input_name)
  game_hash.each do |location, team_data|  
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|            
            if data_item[:player_name] == input_name
              return data_item[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(input_name)
  game_hash.each do |location, team_data|
      if team_data[:team_name] == input_name
        return team_data[:colors]
      end
  end
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_names << team_data[:team_name]
  end
  team_names
end

def player_numbers(team_name)
   nums = []
   game_hash.each do |place, team|
     if team[:team_name] == team_name
       team.each do |attribute, data|
         if attribute == :players
           data.each do |data|
             nums << data[:number]
           end
         end
       end
     end
   end
   nums
end

def player_stats(named_player)
  player_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |team_data|
          if team_data[:player_name] == named_player
            team_data.delete(:player_name)
            return team_data
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  num_rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_data|
      if player_data[:shoe] > biggest_shoe
        biggest_shoe = player_data[:shoe]
        num_rebounds = player_data[:rebounds]
      end
    end
  end
end

def most_points_scored
  most_points_stat = 0
  highest_scorer = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |team_data|
      if team_data[:points] > most_points_stat
        most_points_stat = team_data[:points]
        highest_scorer = team_data[:player_name]
      end
    end
  end
  puts highest_scorer
end

def winning_team
  home_team_total = 0
  away_team_total = 0
  game_hash.each do |location, team_data|
    if location == :home
      team_data[:players].each do |stats|
        home_team_total = home_team_total + stats[:points]
      end
    else location == :away
      team_data[:players].each do |stats|
        away_team_total = away_team_total + stats[:points]
      end
    end
  end
  if home_team_total > away_team_total
    puts game_hash[:home][:team_name]
  elsif away_team_total > home_team_total
    puts game_hash[:away][:team_name]
  else
    puts "Wtf, is this a tie or did I mess this up!"
  end
end

def player_with_longest_name
  name_length = 0
  longest_name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |team_data|
      if team_data[:player_name].length > longest_name.length
        name_length = team_data[:player_name].length
        longest_name = team_data[:player_name]
      end
    end
  end
  return longest_name
end

def player_with_most_of(statistic)
  player_name = nil
  amount_of_stat = 0

  game_hash.each do |team, game_data|
    game_data[:players].each do |player|
      if player[statistic].is_a? String
        if player[statistic].length > amount_of_stat
          amount_of_stat = player[statistic].length
          player_name = player[:player_name]
        end
      elsif player[statistic] > amount_of_stat
        amount_of_stat = player[statistic]
        player_name = player[:player_name]
      end
    end
  end
end

def long_name_steals_a_ton
  player_with_most_of(:steals) == player_with_longest_name
end