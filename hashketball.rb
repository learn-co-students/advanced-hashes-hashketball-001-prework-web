require 'pry'

def game_hash
  game_hash = {
    :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => {"Alan Anderson" => {
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
        :players => {"Jeff Adrien" => {
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

def num_points_scored(name)
  if game_hash[:home][:players].has_key?(name)
      game_hash[:home][:players][name][:points]
  else game_hash[:away][:players].has_key?(name)
        game_hash[:away][:players][name][:points]
  end
end

def shoe_size(name)
  if game_hash[:home][:players].has_key?(name)
      game_hash[:home][:players][name][:shoe]
      
  else game_hash[:away][:players].has_key?(name)
        game_hash[:away][:players][name][:shoe]
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
      game_hash[:home][:colors]
  else game_hash[:away][:team_name] == team_name
        game_hash[:away][:colors]
  end
  #binding.pry
end

def team_names
  game_hash.collect {|k, v| game_hash[k][:team_name]}
end

def player_numbers(team_name)
  game_hash.each do |location, h1| 
    if game_hash[location][:team_name] == team_name
      return game_hash[location][:players].keys.collect {|i| game_hash[location][:players][i][:number]}
    end
  end
end

def player_stats(name)
  if game_hash[:home][:players].keys.include?(name)
    game_hash[:home][:players][name]
  else
    game_hash[:away][:players][name]
  end
end

def big_shoe_rebounds
  shoe_array = game_hash.collect do |location, h1|
    game_hash[location][:players].collect {|player,v1| game_hash[location][:players][player][:shoe]}
  end

  rebounds_array = game_hash.collect do |location, h1|
    game_hash[location][:players].collect {|player,v1| game_hash[location][:players][player][:rebounds]}
  end

  biggest_shoe_size_index = shoe_array.flatten.index(shoe_array.flatten.max)

  rebounds_array.flatten[biggest_shoe_size_index]
end

def most_points_scored
  players_array = game_hash.collect {|location, h1| game_hash[location][:players].keys}

  points_array = game_hash.collect do |location, h1|
    game_hash[location][:players].collect {|player,v1| game_hash[location][:players][player][:points]}
  end

  most_points_index = points_array.flatten.index(points_array.flatten.max)

  players_array.flatten[most_points_index]

end

def winning_team
  points_array = game_hash.collect do |location, h1|
    game_hash[location][:players].collect {|player,v1| game_hash[location][:players][player][:points]}
  end

  home_points = points_array[0].inject(0){|sum,x| sum + x }
  away_points = points_array[1].inject(0){|sum,x| sum + x }

  if home_points > away_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end

  #binding.pry
end


def player_with_longest_name
  players_array = game_hash.collect{|location, h1| game_hash[location][:players].keys}.flatten
  name_length_array = players_array.collect{|name| name.length}
  longest_name_index = name_length_array.index(name_length_array.max)
  players_array[longest_name_index]

end

def player_with_most_steals
  steals_array = game_hash.collect {|location, h1|
    game_hash[location][:players].collect{|player,v1| game_hash[location][:players][player][:steals]}
  }.flatten

  players_array = game_hash.collect{|location, h1| game_hash[location][:players].keys}.flatten

  higest_steals_index = steals_array.index(steals_array.max)

  players_array[higest_steals_index]
end

def long_name_steals_a_ton?
  player_with_most_steals == player_with_longest_name
end

