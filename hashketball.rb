require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
       "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
       "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
       "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
       "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
       "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
       "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 
        },
       "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 
        },
       "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12 
        }
      }
    }

  }

end

def num_points_scored(player_name)
  game_hash.each do |location, team_info|
    #binding.pry
    player_loc = location
    team_info.each do |key, value|
      #binding.pry
      if key == :players
      value.each do |key, value|
        #binding.pry
        if key == player_name
          points_scored = game_hash[player_loc][:players][player_name][:points]
          return points_scored
        end
      end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_info|
    #binding.pry
    player_loc = location
    team_info.each do |key, value|
   #   binding.pry
      if key == :players
      value.each do |key, value|
    #    binding.pry
        if key == player_name
          size_shoe = game_hash[player_loc][:players][player_name][:shoe]
          return size_shoe
        end
      end
      end
    end
  end
end

shoe_size("Alan Anderson")

def team_colors(name_team)
  game_hash.each do |location, team_info|
    #binding.pry
    if game_hash[location][:team_name] == name_team
      colors = game_hash[location][:colors]
      return colors
    end
  end
end

def team_names
  team_names = []
  game_hash.each do |location, team_info|
    team_names << game_hash[location][:team_name]
  end
  team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |location, team_info|
    if game_hash[location][:team_name] == team_name
    team_info.each do |team_info, player_name|
      if team_info == :players
        player_name.each do |player_name, stats|
          jersey_numbers << game_hash[location][:players][player_name][:number]
        end
      end
    end
    end
  end
jersey_numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_info|
    team_info.each do |team_info, player_names|
      if team_info == :players
        player_names.each do |player_names, stats|
          if player_names == player_name
            return game_hash[location][:players][player_names]
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_size = nil
  largest_shoe_player = nil
  game_hash.each do |location, team_info|
    team_info.each do |team_info, player_names|
      if team_info == :players
        player_names.each do |player_names, stats|
          if largest_shoe_size == nil || game_hash[location][:players][player_names][:shoe] > largest_shoe_size
            largest_shoe_size = game_hash[location][:players][player_names][:shoe]
            largest_shoe_player = player_names
          end
        end
      end
    end
  end

  game_hash.each do |location, team_info|
    team_info.each do |team_info, player_names|
      if team_info == :players
        player_names.each do |player_names, stats|
          if player_names == largest_shoe_player
            return game_hash[location][:players][player_names][:rebounds]
          end
        end
      end
    end
  end
end
