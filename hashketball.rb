require 'pry' 
def deep_extract_keys(hash)
  hash.keys + hash.values.flat_map {|value| deep_extract_keys value }
end
def game_hash

  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
        :players => {
        :player1 => {
          :name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :stats => {
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          }
        },
          :player2 => {
        :name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :stats => {
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }
      },
      :player3 => {
        :name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :stats => {
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }
      },
      :player4 => {
        :name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :stats => {
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }
      },
      :player5 => {
        :name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :stats => {
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    }
  },
    :away => {
          :team_name => "Charlotte Hornets", 
          :colors => ["Turquoise", "Purple"],
          :players => {
            :player1 => {
              :name => "Jeff Adrien",
              :number => 4,
              :shoe => 18,
              :stats => {
                :points => 10,
                :rebounds => 1,
              :assists => 1,
              :steals => 2,
              :blocks => 7,
              :slam_dunks => 2
          }
        },
          :player2 => {
        :name => "Bismak Biyombo",
        :number => 0,
        :shoe => 16,
        :stats => {
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        }
      },
      :player3 => {
        :name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :stats => {
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }
      },
      :player4 => {
        :name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :stats => {
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }
      },
        :player5 => {
        :name => "Brendan Haywood",
        :number => 33,
        :shoe => 15,
        :stats => {
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
    }
  end 

  def num_points_scored(player_name)
   
     game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
          if attribute == :players
           data.each do |key, value|
            value.each do |statistic, num|
              if num == player_name
                return game_hash[location][attribute][key][:stats][:points]
              end
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
           data.each do |key, value|
            value.each do |statistic, num|
              if num == player_name
                return game_hash[location][attribute][key][:shoe]
              end
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
            #binding.pry
            return game_hash[location][:colors]
          end
        end
      end
    end

    def team_names
      teams = []
      game_hash.each do |location, team_data|
        team_data.collect do |attribute, data|
          if attribute == :team_name
            teams << data
         end
        end
      end
      teams
    end

    def player_numbers(team_name)
      numbers = []
      game_hash.each do |location, team_data|
        team_data.each do |attribute, data|          
          if attribute == :team_name && data == team_name
            team_data[:players].each do |player, hash|
              hash.each do |statistic, num|
                if statistic == :number
                  numbers << num
                end
              end
            end
          end
        end
      end
    numbers
    end

    def player_stats(player_name)
      stats = {}
      game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
          if attribute == :players
            data.each do |key, value|
              value.each do |statistic, num|
                if num == player_name
                  value.each do | static2, value2|
                  if value2.is_a?(Hash)
                    stats.merge!(value2)                
                  else
                    stats[static2] = value2
                  end
                end
              end
            end
          end 
        end
      end
    end
    stats.delete_if {|key, value| key == :name }
  end

  def big_shoe_rebounds
    cur_biggest = 0
    biggest_name = ""
    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |key, value|
            value.each do |statistic, num|        
              if cur_biggest < game_hash[location][attribute][key][:shoe]
                cur_biggest = game_hash[location][attribute][key][:shoe]                 
                biggest_name = game_hash[location][attribute][key][:name]
              end
            end
          end 
        end
      end
    end
    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |key, value|
            value.each do |statistic, num|
              if num == biggest_name
                return game_hash[location][attribute][key][:stats][:rebounds]
              end
            end
          end 
        end
      end
    end
  end


  
  



          