# Write your code here!
require 'pry'

def game_hash 
  game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [ 
      {
      :player_name => "Alan Anderson",
      :number =>0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      }, 
      {
      :player_name => "Reggie Evans",
      :number =>30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },      
      {
      :player_name => "Brook Lopez",
      :number =>11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :player_name => "Mason Plumlee",
      :number =>1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :player_name => "Jason Terry",
      :number =>31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }]
    },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [{
      :player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2,
      },
      {
      :player_name => "Bismak Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10,
      },
      {
      :player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5,
      },
      {
      :player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :player_name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12,
      }]
    }
}
end

def num_points_scored(player_name)
  game_hash.each do |item, full_hash|
    full_hash.each do |atr, values|
      if atr == :players
        values.each do |stats|
          if stats[:player_name] == player_name
            return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |item, full_hash|
    full_hash.each do |atr, values|
        if atr == :players
          values.each do |stat_arr|
            if stat_arr[:player_name] == player_name
              return stat_arr[:shoe]
            end
          end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, atr_hash|
      if atr_hash[:team_name] == team_name 
          return atr_hash[:colors]
      end
  end
end


def team_names
  game_hash.collect do |k,v|
    v[:team_name]
    end
end

  
def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |team, atr_hash|
    if atr_hash[:team_name] == team_name
      atr_hash.each do |atr, values|
        if atr == :players
          jersey_numbers = values.collect { |stat_hash| stat_hash[:number] }
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  game_hash.each do |team, atr_hash|
    atr_hash.each do |atr, values|
      if atr == :players
        values.each do |stat_hash|
          if stat_hash[:player_name] == player_name
            stats = stat_hash
            stats.delete(:player_name)
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = {shoe: 0, rebounds: 0}
  game_hash.each do |team, atr_hash|
    atr_hash.each do |atr, values|
      if atr == :players
        values.each do |stat_hash|
          if stat_hash[:shoe] > big_shoe[:shoe]
            big_shoe[:shoe] = stat_hash[:shoe]
            big_shoe[:rebounds] = stat_hash[:rebounds]
          end
        end
      end
    end
  end
  big_shoe[:rebounds]
end











