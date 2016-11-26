require 'pry'

def game_hash
game_hash = {

  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },     
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
    },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2 
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5 
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
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
end

def home_team_name
  puts game_hash[:home][:team_name]
end






=begin def good_practices
  game_hash.each do |location, team_data|
    puts team_data
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
      end
    end
  end
end

good_practices
=end


def num_points_scored(player_name)

  points_scored = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data| 
      if data.is_a?(Hash)
        data.each do |name, stats|
          if name == player_name
            points_scored = stats[:points]
          end
        end
      end
    end
  end

  return points_scored
end

def shoe_size(player_name)

    size = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data| 
      if data.is_a?(Hash)
        data.each do |name, stats|
          if name == player_name
            size = stats[:shoe]
          end
        end
      end
    end
  end

  return size
end


def team_colors(team_name)
      colors = []

  if team_name == "Brooklyn Nets"
    colors = ["Black", "White"]
  elsif team_name == "Charlotte Hornets"
    colors = ["Turquoise", "Purple"]
  end
  return colors
end

def team_names

  teams = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        teams << data
      end
    end
  end

  return teams
end

def player_numbers(team_name)

  nets_numbers = []
  hornets_numbers = []
  jersey_numbers = []

        game_hash[:home][:players].each do |name, info|
          info.each do |key, value|
            if key == :number 
              nets_numbers << value
            end
          end
        end

        game_hash[:away][:players].each do |name, info|
          info.each do |key, value|
            if key == :number 
              hornets_numbers << value
            end
          end
        end

  game_hash.each do |location, team_data|
    team_data.each do |attribute, value|
      if value == "Brooklyn Nets" && team_name == "Brooklyn Nets"
         jersey_numbers = nets_numbers
       elsif value == "Charlotte Hornets"&& team_name == "Charlotte Hornets"
         jersey_numbers = hornets_numbers 
        end
      end
    end

  return jersey_numbers
end


def player_stats(player_name)
stats = {}
game_hash.each do |location, team_data|
  team_data.each do |key, value|
    if key == :players
      value.each do |player, data|
        if player == player_name
          stats = data
        end
      end
    end

    end
  end
return stats
end



if game_hash[:home][:players]["Alan Anderson"][:shoe] == 16
  puts "I'm an integer!"

end


def big_shoe_rebounds

  shoe_size = game_hash[:home][:players]["Alan Anderson"][:shoe]

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Hash)
        data.each do |name, stats|
          if stats[:shoe] > shoe_size
            shoe_size = stats[:shoe]
          end
        end
      end
    end
  end

  player_name = ""

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Hash)
        data.each do |name, stats|
          if stats[:shoe] == shoe_size
            player_name = name
          end
        end
      end
    end
  end



  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data| 
      if data.is_a?(Hash)
        data.each do |names, stats|
          if names == player_name
            rebounds = stats[:rebounds]
          end
        end
      end
    end
  end

  return rebounds

end
puts big_shoe_rebounds

