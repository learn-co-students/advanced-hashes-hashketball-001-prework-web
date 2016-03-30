# Write your code here!
require 'pry'

def game_hash
  hash = {
    :home =>{
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
          {
          :player_name => "Alan Anderson",
          :number => 0,
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
          :number => 30,
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
          :number => 11,
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
          :number => 1,
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
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
          {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
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
          :slam_dunks => 10
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
          :slam_dunks => 5
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
          :slam_dunks => 12
          }
      ]
    }
  }


end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(player)
  points = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_hash|
          if data_hash.has_value?(player)
            points = data_hash[:points]
          end
        end
      end
    end
  end
  points
end

def shoe_size(player)
  shoe_size = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_hash|
          if data_hash.has_value?(player)
            shoe_size = data_hash[:shoe]
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team)
  colors = nil
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team
      colors = (game_hash[location][:colors])
    end
  end
  colors
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    names << game_hash[location][:team_name]
  end
  names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data.has_value?(team)
      game_hash[location][:players].each do |data_hash|
        data_hash.each do |skill, value|
          if skill == :number
            numbers << data_hash[:number]
          end
        end
      end
    end
  end
  numbers
end

def player_stats(player)
  stats = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_hash|
          if data_hash.has_value?(player)
            stats = data_hash.delete_if{ |k,v| k == :player_name }
          end
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  rebounds = nil
  shoe_sizes = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_hash|
          shoe_sizes << data_hash[:shoe]
        end
      end
    end
  end
  biggest_shoe = shoe_sizes.sort[-1]
  biggest_shoe
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_hash|
          if data_hash[:shoe] == biggest_shoe
            rebounds = data_hash[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end










