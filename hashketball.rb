# Write your code here!
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        :player_name => ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"],
        :number => [0, 30, 11, 1, 31],
        :shoe => [16, 14, 17, 19, 15],
        :points => [22, 12, 17, 26, 19],
        :rebounds => [12, 12, 19, 12, 2],
        :assists => [12, 12, 10, 6, 2],
        :steals => [3, 12, 3, 3, 4],
        :blocks => [1, 12, 1, 8, 11],
        :slam_dunks => [1, 7, 15, 5, 1]
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        :player_name => ["Jeff Adrien", "Bismak Biyombo", "DeSagna Diop", "Ben Gordon", "Brendan Haywood"],
        :number => [4, 0, 2, 8, 33],
        :shoe => [18, 16, 14, 15, 15],
        :points => [10, 12, 24, 33, 6],
        :rebounds => [1, 4, 12, 3, 12],
        :assists => [1, 7, 12, 2, 12],
        :steals => [2, 7, 4, 1, 22],
        :blocks => [7, 15, 5, 1, 5],
        :slam_dunks => [2, 10, 5, 0, 12]
      }
    }
  }
end

def player_stat(name, stat)
  index = nil
  stat_value = nil
  game_hash.each do |homeaway, team|
    index = team[:players][:player_name].find_index(name)
    if index != nil
      stat_value = team[:players][stat][index]
      break
    end
  end
  stat_value
end

def num_points_scored(name)
  player_stat(name, :points)
end

def shoe_size(name)
  player_stat(name, :shoe)
end

def team_colors(team_name)
  game_hash.each do |homeaway, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  names = []
  game_hash.each do |homeaway, team|
    names << team[:team_name]
  end
  names
end

def player_numbers(team_name)
  game_hash.each do |homeaway, team|
    if team[:team_name] == team_name
      return team[:players][:number]
    end
  end
end

def player_stats(name)
  index = nil
  stats = {}
  game_hash.each do |homeaway, team|
    index = team[:players][:player_name].find_index(name)
    if index != nil
      team[:players].each do |k, v|
        if k != :player_name then stats[k] = v[index] end
      end
      break
    end
  end
  stats
end

def big_shoe_rebounds
  shoe_size = 0
  max_size = 0
  rebounds = 0
  game_hash.each do |homeaway, team|
    team_max = team[:players][:shoe].max
    if team_max > max_size
      max_size = team_max
      index = team[:players][:shoe].find_index(team_max)
      rebounds = team[:players][:rebounds][index]
    end
  end
  rebounds
end