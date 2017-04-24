def game_hash
  hash = {
    :home =>
      {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players =>
        {
        "Alan Anderson" =>
          {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
        "Reggie Evans" =>
          {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
        "Brook Lopez" =>
          {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
        "Mason Plumlee" =>
          {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
        "Jason Terry" =>
          {
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
    :away =>
      {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players =>
        {
        "Jeff Adrien" =>
          {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
        "Bismak Biyombo" =>
          {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 7,
            :blocks => 15,
            :slam_dunks => 10
          },
        "DeSagna Diop" =>
          {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
        "Ben Gordon" =>
          {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
        "Brendan Haywood" =>
          {
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
  game_hash.each do |location, data|
    data[:players].each do |player, stats|
      return stats[:points] if player == name
    end
  end
end


def shoe_size(name)
  game_hash.each do |location, data|
    data[:players].each do |player, stats|
      return stats[:shoe] if player == name
    end
  end
end


def team_colors(team)
  game_hash.each do |location, data|
    return data[:colors] if data[:team_name] == team
  end
end


def team_names
  game_hash.map { |location, data| data[:team_name] }
end


def player_numbers(team)
  arr = []

  game_hash.each do |location, data|
    if data[:team_name] == team
      data[:players].each do |player, stats|
        stats.each do |stat, value|
          arr << value if stat == :number
        end
      end
    end
  end

  arr
end


def player_stats(name)
  game_hash.each do |location, data|
    data[:players].each do |player, stats|
      return stats if player == name
    end
  end
end

def big_shoe_rebounds
  name = ""
  largest_shoe_size = 0

  game_hash.each do |location, data|
    data[:players].each do |player, stats|
      if shoe_size(player) > largest_shoe_size
        name = player
        largest_shoe_size = shoe_size(player)
      end
    end
  end

  game_hash.each do |location, data|
    data[:players].each do |player, stats|
      return stats[:rebounds] if player == name
    end
  end
end


def most_points_scored
  name = ""
  most_points = 0

  game_hash.each do |location, data|
    data[:players].each do |player, stats|
      if num_points_scored(player) > most_points
        name = player
        most_points = num_points_scored(player)
      end
    end
  end

  name
end

def winning_team
  team_score = 0
  team_scores = {}

  game_hash.each do |location, data|
    data[:players].each do |player, stats|
      team_score += num_points_scored(player)
    end

    team_scores[data[:team_name]] = team_score
  end

  team_scores.sort_by {|team, score| score}.to_h.keys.first
end


def player_with_longest_name
  players_arr = game_hash.map { |location, data| data[:players].keys }.flatten
  players_arr.sort_by {|name| name.length}.last
end

def long_name_steals_a_ton?
  player_steals = {}

  game_hash.each do |location, data|
    data[:players].each do |player, stats|
       player_steals[player] = stats[:steals]
    end
  end

  biggest_stealer = player_steals.sort_by {|name, steals| steals}.to_h.keys.last

  biggest_stealer == player_with_longest_name ? true : false
end






