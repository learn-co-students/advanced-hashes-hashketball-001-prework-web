# Write your code here!
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
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
        "Reggie Evans" => {
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
        "Brook Lopez" => {
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
        "Mason Plumlee" => {
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
        "Jason Terry" => {
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
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
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
        "Bismak Biyombo" => {
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
        "DeSagna Diop" => {
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
        "Ben Gordon" => {
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
        "Brendan Haywood" => {
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
      }
    }
  }
end

def num_points_scored(player)
  hash = game_hash
  points_scored = 0
  game_hash.each do |team, value|
    if value[:players].include? player
      points_scored = value[:players][player][:points]
    end
  end
  points_scored
end

def shoe_size(player)
  shoe = 0
  game_hash.each do |team, value|
    if value[:players].include? player
      shoe = value[:players][player][:shoe]
    end
  end
  shoe
end

def team_colors(team_name)
  teamcolors = 0
  game_hash.each do |team, value|
    if value[:team_name].include? team_name
      teamcolors = value[:colors]
    end
  end
  teamcolors
end

def team_names
  team_array = []
  game_hash.each do |team, value|
    team_array << value[:team_name]
  end
  team_array
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |team, value|
    if value[:team_name] == team_name
      value[:players].each do |player, stats|
        numbers << stats[:number]
      end
    end
  end
  numbers
end

def player_stats(player)
  stats_hash = {}
  game_hash.each do |team, value|
    if value[:players].include? player
      stats_hash = value[:players][player]
    end
  end
  stats_hash.delete(:player_name)
  stats_hash
end

def big_shoe_rebounds
  hash = game_hash
  biggest_shoe = 0
  num_rebounds = 0
  hash.each do |teams, values|
    values[:players].each do |player, stats|
      if stats[:shoe] > biggest_shoe
        biggest_shoe = stats[:shoe]
        num_rebounds = stats[:rebounds]
      end
    end
  end
  num_rebounds
end









