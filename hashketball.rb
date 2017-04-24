require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
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

def num_points_scored(name)

  game_hash.each do |k,v|
    if game_hash[k][:players][name] != nil
      return game_hash[k][:players][name][:points]
    end
  end

end

def shoe_size(name)

  game_hash.each do |k,v|
    if game_hash[k][:players][name] != nil
      return game_hash[k][:players][name][:shoe]
    end
  end

end

def team_colors(team)

  game_hash.each do |k,v|
    if game_hash[k][:team_name] == team
      return game_hash[k][:colors]
    end
  end

end

def team_names
  arr = []

  game_hash.each do |k,v|
    arr << game_hash[k][:team_name]
  end

  arr
end

def player_numbers(team)
  arr = []

  game_hash.each do |k,v|
    if game_hash[k][:team_name] == team
      game_hash[k][:players].each do |name, stat|
        arr << game_hash[k][:players][name][:number]
      end
    end
  end

  arr
end

def player_stats(name)

  game_hash.each do |k,v|
    if game_hash[k][:players][name] != nil
      return game_hash[k][:players][name]
    end
  end

end

def big_shoe_rebounds
  
  arr = []

  game_hash.each do |k,v|
      game_hash[k][:players].each do |name, stat|
        arr << game_hash[k][:players][name][:shoe]
      end
  end

  shoe_max = arr.max

  game_hash.each do |k,v|
    game_hash[k][:players].each do |name, stat|
      if game_hash[k][:players][name][:shoe] == shoe_max
        return game_hash[k][:players][name][:rebounds]
      end
    end
  end

end

def most_points_scored
  
  arr = []

  game_hash.each do |k,v|
      game_hash[k][:players].each do |name, stat|
        arr << game_hash[k][:players][name][:points]
      end
  end

  points_max = arr.max

  game_hash.each do |k,v|
    game_hash[k][:players].each do |name, stat|
      if game_hash[k][:players][name][:points] == points_max
        return name
      end
    end
  end

end

def winning_team
  
  home_arr = []
  away_arr = []

      game_hash[:home][:players].each do |name, stat|
        home_arr << game_hash[:home][:players][name][:points]
      end

      game_hash[:away][:players].each do |name, stat|
        away_arr << game_hash[:away][:players][name][:points]
      end

  if home_arr.inject {|sum, n| sum + n} > away_arr.inject {|sum, n| sum + n} 
    return game_hash[:home][:team_name]
  elsif home_arr.inject {|sum, n| sum + n} < away_arr.inject {|sum, n| sum + n} 
    return game_hash[:away][:team_name]
  else
    return "It's a tie!"
  end

end

def player_with_longest_name
  
  arr = []

  game_hash.each do |k,v|
      game_hash[k][:players].each do |name, stat|
        arr << name
      end
  end

longest_name_length = 0
longest_name = ""

arr.each do |name|
  if name.length > longest_name_length
    longest_name_length = name.length
    longest_name = name
  end
end

return longest_name
end

def long_name_steals_a_ton?

  longest_name = player_with_longest_name

  arr = []

  game_hash.each do |k,v|
      game_hash[k][:players].each do |name, stat|
        arr << game_hash[k][:players][name][:steals]
      end
  end

  steals_max = arr.max
  
  game_hash.each do |k,v|
    if game_hash[k][:players][longest_name] != nil
      return game_hash[k][:players][longest_name][:steals] == steals_max
    end
  end

end