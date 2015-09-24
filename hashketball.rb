def game_hash
  gamehash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [
                {:player_name => "Alan Anderson",
                :number => 0,
                :shoe => 16,
                :points => 22, 
                :rebounds => 12, 
                :assists => 12, 
                :steals => 3, 
                :blocks => 1, 
                :slam_dunks => 1 },
                
                {:player_name => "Reggie Evans",
                :number => 30,
                :shoe => 14,
                :points => 12, 
                :rebounds => 12, 
                :assists => 12, 
                :steals => 12, 
                :blocks => 12, 
                :slam_dunks => 7},
                
                {:player_name => "Brook Lopez",
                :number => 11,
                :shoe => 17,
                :points => 17, 
                :rebounds => 19, 
                :assists => 10, 
                :steals => 3, 
                :blocks => 1, 
                :slam_dunks => 15},
                
                {:player_name => "Mason Plumlee",
                :number => 1,
                :shoe => 19,
                :points => 26, 
                :rebounds => 12, 
                :assists => 6, 
                :steals => 3, 
                :blocks => 8, 
                :slam_dunks => 5},
                
                {:player_name => "Jason Terry",
                :number => 31,
                :shoe => 15,
                :points => 19, 
                :rebounds => 2, 
                :assists => 2, 
                :steals => 4, 
                :blocks => 11, 
                :slam_dunks => 1}]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [
                {:player_name => "Jeff Adrien",
                :number => 4,
                :shoe => 18,
                :points => 10, 
                :rebounds => 1, 
                :assists => 1, 
                :steals => 2, 
                :blocks => 7, 
                :slam_dunks => 2},
                
                {:player_name => "Bismak Biyombo",
                :number => 0,
                :shoe => 16,
                :points => 12, 
                :rebounds => 4, 
                :assists => 7, 
                :steals => 7, 
                :blocks => 15, 
                :slam_dunks => 10},
                
                {:player_name => "DeSagna Diop",
                :number => 2,
                :shoe => 14,
                :points => 24, 
                :rebounds => 12, 
                :assists => 12, 
                :steals => 4, 
                :blocks => 5, 
                :slam_dunks => 5},
                
                {:player_name => "Ben Gordon",
                :number => 8,
                :shoe => 15,
                :points => 33, 
                :rebounds => 3, 
                :assists => 2, 
                :steals => 1, 
                :blocks => 1, 
                :slam_dunks => 0 },
                
                {:player_name => "Brendan Haywood",
                :number => 33,
                :shoe => 15,
                :points => 6, 
                :rebounds => 12, 
                :assists => 12, 
                :steals => 22, 
                :blocks => 5, 
                :slam_dunks => 12}]
    }
      
  } 
  return gamehash
end# Write your code here!

def num_points_scored(name)
points = game_hash.collect do |location, team_data|
        team_data.collect do |key, value|
            if key == :players
                value.collect do |data_item|
                    if data_item.values.include?(name)
                        data_item[:points]
                    end
                end
            end
        end
    end
    points.flatten.compact.inject(0, :+)
end

def shoe_size(name)
    shoe = game_hash.collect do |location, team_data|
        team_data.collect do |key, value|
            if key == :players
                value.collect do |data_item|
                    if data_item.values.include?(name)
                        data_item[:shoe]
                    end
                end
            end
        end
    end
    shoe.flatten.compact.inject(0, :+)
end

def team_colors(name)
    colors = game_hash.collect do |location, team_data|
        if team_data.values.include?(name)
            team_data[:colors]
        end
    end
    colors.flatten.compact
end

def team_names
    team = game_hash.collect do |location, team_data|
        team_data[:team_name]
    end
    team.flatten.compact
end

def player_numbers(name)
    numbers = game_hash.collect do |location, team_data|
        if team_data.values.include?(name)
            team_data.collect do |key, value|
                if key == :players
                    value.collect do |data_item|
                        data_item[:number]
                    end
                end
            end
        end
    end
    numbers.flatten.compact
end

def player_stats(name)
    points = {}
    game_hash.each do |location, team_data|
        team_data.each do |key, value|
            if key == :players
                value.each do |data_item|
                    if data_item.values.include?(name)
                        points = data_item
                    end
                end
            end
        end
    end
    points.delete(:player_name)
    points
end

def big_shoe_rebounds
    shoe = 0
    rebounds = 0
    game_hash.collect do |location, team_data|
        team_data.collect do |key, value|
            if key == :players
                value.collect do |data_item|
                    if data_item[:shoe] > shoe
                        shoe = data_item[:shoe]
                        rebounds = data_item[:rebounds]
                    end
                end
            end
        end
    end
    rebounds
end








