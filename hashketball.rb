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

  return game_hash
end


def num_points_scored(playerName)
  game_hash[:home][:players].each do |home_player_name, home_player_data|
    if home_player_name == playerName
      return home_player_data[:points]
    else
      game_hash[:away][:players].each do |away_player_name, away_player_data|
        if away_player_name == playerName
          return away_player_data[:points]
         end
      end
    end
  end
end

def shoe_size(playerName)
  game_hash[:home][:players].each do |home_player_name, home_player_data|
    if home_player_name == playerName
      return home_player_data[:shoe]
    else
      game_hash[:away][:players].each do |away_player_name, away_player_data|
        if away_player_name == playerName
          return away_player_data[:shoe]
         end
      end
    end
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    return game_hash[:away][:colors]
  end    
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
  teams
end

def player_numbers(teamName)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == teamName
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, player_info|
            numbers << player_info[:number]
          end
        end
      end  
    end 
  end 
  numbers 
end

def player_stats(playerName)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_info|
          if player_name == playerName
            return player_info
          end  
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_info|
          if player_info[:shoe] > shoe_size
              shoe_size = player_info[:shoe]
              rebounds = player_info[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end



