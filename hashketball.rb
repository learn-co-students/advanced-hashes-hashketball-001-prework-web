# Write your code here!
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

def num_points_scored(player_name)
  game_hash.each do |place, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == player_name
            return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |place, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == player_name
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team_info|
    if team_info[:team_name] == team_name
      return team_info[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |place, team_info|
    teams << team_info[:team_name]
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |place, team_info|
    if team_info[:team_name] == team_name
      team_info.each do |attribute, data|
        if attribute == :players
          data.each do |name, stats|
            numbers << stats[:number]
          end
        end
      end
    end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each do |place, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  num_rebounds = 0
  game_hash.each do |place, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats| 
          if stats[:shoe] > biggest_shoe
            biggest_shoe = stats[:shoe]  
            num_rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  num_rebounds
end

def most_points_scored
  points = 0
  top_player = nil
  game_hash.each do |place, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats| 
          if stats[:points] > points
            points = stats[:points]
            top_player = name
          end
        end
      end
    end
  end
  top_player
end

def winning_team
  nets_points = 0
  hornets_points = 0
  game_hash[:home].each do |attribute, data|
    if attribute == :players
      data.each do |name, stats|
        nets_points = nets_points + stats[:points] 
      end
    end
  end
  game_hash[:away].each do |attribute, data|
    if attribute == :players
      data.each do |name, stats|
        hornets_points = hornets_points + stats[:points] 
      end
    end
  end
  if nets_points > hornets_points
    return "Brooklyn Nets"
  else  
    return "Charlotte Hornets"
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |place, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats| 
          if name.length > longest_name.length
            longest_name = name
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  longest_name = ""
  most_steals = 0
  player_with_most_steals = ""
  game_hash.each do |place, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats| 
          if name.length > longest_name.length
            longest_name = name
          end
          if stats[:steals] > most_steals
            most_steals = stats[:steals]
            player_with_most_steals = name
          end
        end
      end
    end
  end
  if longest_name == player_with_most_steals
    true
  else
    false
  end
end
