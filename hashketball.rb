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
        team_data[:players].each do |player, p_hash|
          if p_hash[:name] == player_name
            return p_hash[:stats][:points]
          end 
        end
      end
    end

  def shoe_size(player_name)
        game_hash.each do |location, team_data|
          team_data[:players].each do |players, p_hash|
            if p_hash[:name] == player_name
              return p_hash[:shoe]
            end
          end
        end
      end

  def team_colors(team_name)
    colors = []
    game_hash.each do |location, team_data|
      team_data[:colors].each do |color|
        if team_data[:team_name] == team_name
          colors << color
        end
      end
    end
    colors
  end

    def team_names
      game_hash.collect do |location, team_data|
        team_data[:team_name]
      end
    end

    def player_numbers(team_name)
      numbers = []
      game_hash.each do |location, team_data|
        if team_data[:team_name] == team_name
          team_data[:players].each do |player, p_hash|          
            numbers << p_hash[:number]
          end
        end
      end
    numbers
    end

    def player_stats(player_name)
      return_stats = {}
      game_hash.each do |location, team_data|
        team_data[:players].each do |player, stats|
          if stats[:name] == player_name
            stats.each do |key, value|
            if value.is_a?(Hash)
              return_stats.merge!(value)                
            else
              return_stats[key] = value
            end
          end
        end
      end
    end
    return_stats.delete_if {|key, value| key == :name }
  end

  def big_shoe_rebounds
    rebounds = 0
    cur_biggest = 0
    biggest_name = ""
    game_hash.each do |location, team_data|
      team_data[:players].each do |attribute, data|
        if cur_biggest < data[:shoe] 
          cur_biggest = data[:shoe]                  
          rebounds = data[:stats][:rebounds]
        end
      end
    end 
  
    rebounds
  end
    



  
  



          