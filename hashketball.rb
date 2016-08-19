require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1},
      }
    },

    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      }
    }
  }
end

def num_points_scored(players_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == players_name
        # binding.pry
        return stats[:points]
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == players_name
        # binding.pry
        return stats[:shoe]
      end
    end
  end
end


def team_colors(team_name)
  game_hash.collect do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors] #how to avoid hard coding return?
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  jeresey_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |name, stats|
        jeresey_numbers << stats[:number]
        # binding.pry
      end
      return jeresey_numbers
    end
  end
end


def player_stats(players_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == players_name
        # binding.pry
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  max_shoe = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if stats[:shoe] > max_shoe
        max_shoe = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  max_points = 0
  player = " "
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if stats[:points] > max_points
        max_points = stats[:points]
        player = name
      end
    end
  end
  player
end

def winning_team
  home_team = []
	away_team = []
  game_hash.collect do |location, team_data|
    team_data[:players].collect do |name,stats|

      if team_data[:team_name] == "Brooklyn Nets"
        home_team << stats[:points]
      else
        away_team << stats[:points]
      end
    end
  end


  if home_team.inject{|sum,x| sum + x} > away_team.inject{|sum,x| sum + x}
    home_team.inject{|sum,x| sum + x}
    return game_hash[:home][:team_name]

  else
    away_team.inject{|sum,x| sum + x}
    return game_hash[:away][:team_name]
  end
end

# def player_with_longest_name
#   array = []
#   game_hash.collect do |location, team_data|
#     team_data[:players].keys.collect do |name|
#       array << name.length
#     end
#   end
#   array.max
# end
def player_with_longest_name
   array = []
   array2 = []
   max_name = ""
   game_hash.collect do |location, team_data|
     team_data[:players].keys.collect do |name|
       array << name
       array2 << name.length
     end
   end
	 max = array2.max
   array.collect do |name|
     if 	name.length == max
       max_name = name
     end
   end
   max_name
 end

def long_name_steals_a_ton?
    game_hash.each do |location, team_data|
      team_data[:players].each do |name, stats|
        if name == player_with_longest_name
          stats.each do |stat, steals|
            if stat == :steals
              return !!steals
            end
        end
      end
    end
  end
end
